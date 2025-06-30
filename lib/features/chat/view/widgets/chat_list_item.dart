import 'package:flutter/material.dart';
import 'package:litera_app/features/chat/model/chat_list_item_model.dart';
import 'package:litera_app/features/chat/view/pages/chat_page.dart';

class ChatListItem extends StatelessWidget {
  final ChatListItemModel chat;
  const ChatListItem({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    // Ganti dengan ID user yang sedang login
    const String currentUserId = 'pemilik_789'; 

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      leading: CircleAvatar(
        radius: 28,
        backgroundImage: NetworkImage(chat.imageUrl),
      ),
      title: Text(
        chat.name,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        chat.lastMessage,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: () {
        // Navigasi ke halaman detail chat dengan membawa data 'offer'
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatPage(
              offer: chat.offer,
              currentUserId: currentUserId,
            ),
          ),
        );
      },
    );
  }
}