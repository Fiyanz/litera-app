// lib/features/chat/view/pages/chat_page.dart
import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart';
import 'package:litera_app/features/chat/model/chat_message.dart';
import 'package:litera_app/features/chat/model/loan_offer.dart';
import 'package:litera_app/features/chat/view/widgets/chat_input_field.dart';
import 'package:litera_app/features/chat/view/widgets/chat_message_bubble.dart';
import 'package:litera_app/features/chat/view/widgets/loan_offer_sent_bubble.dart';
import 'package:litera_app/features/chat/view/widgets/loan_request_bubble.dart';

class ChatPage extends StatefulWidget {
  final LoanOffer offer;
  final String currentUserId;

  const ChatPage({
    super.key,
    required this.offer,
    required this.currentUserId,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _messageController = TextEditingController();
  late final List<dynamic> _chatItems;

  @override
  void initState() {
    super.initState();
    _chatItems = [
      // Urutan dibalik untuk 'reverse: true' di ListView
      // Pesan terlama ada di akhir list
      ChatMessage(id: 'msg2', text: 'Baik, silakan dikonfirmasi penawarannya ya.', senderId: widget.offer.bookOwnerId, timestamp: DateTime.now().subtract(const Duration(minutes: 1))),
      ChatMessage(id: 'msg1', text: 'Halo, saya tertarik untuk meminjam buku ini.', senderId: widget.offer.borrowerId, timestamp: DateTime.now().subtract(const Duration(minutes: 2))),
      widget.offer, 
    ];
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final text = _messageController.text.trim();
    if (text.isEmpty) return;

    final newMessage = ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: text,
      senderId: widget.currentUserId,
      timestamp: DateTime.now(),
    );

    // TODO: Kirim 'newMessage' ke server melalui API Anda

    setState(() {
      // PERBAIKAN: Gunakan insert di indeks 0 agar muncul di paling bawah (karena list di-reverse)
      _chatItems.insert(0, newMessage); 
      _messageController.clear();
      FocusScope.of(context).unfocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isOwner = widget.offer.bookOwnerId == widget.currentUserId;
    final String chatPartnerId = isOwner ? widget.offer.borrowerId : widget.offer.bookOwnerId;
    // URL avatar untuk partner chat (bisa diganti dengan data asli nanti)
    final String partnerAvatarUrl = 'https://ui-avatars.com/api/?name=${chatPartnerId.replaceAll('_', '+')}&background=random';


    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage(partnerAvatarUrl),
            ),
            const SizedBox(width: 12),
            Text(chatPartnerId),
          ],
        ),
        backgroundColor: Pallete.primaryColor,
      ),
      // PERBAIKAN: Pindahkan ChatInputField ke bottomNavigationBar
      // Ini akan otomatis menangani masalah keyboard yang menutupi input field.
      bottomNavigationBar: ChatInputField(
        controller: _messageController,
        onSendPressed: _sendMessage,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        // PERBAIKAN: reverse = true membuat list dimulai dari bawah dan auto-scroll ke pesan baru
        reverse: true, 
        itemCount: _chatItems.length,
        itemBuilder: (context, index) {
          final item = _chatItems[index];

          if (item is LoanOffer) {
            return isOwner
                ? LoanRequestBubble(offer: item)
                : LoanOfferSentBubble(offer: item);
          } 
          else if (item is ChatMessage) {
            return ChatMessageBubble(
              message: item,
              isMe: item.senderId == widget.currentUserId,
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}