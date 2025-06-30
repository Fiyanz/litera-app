// lib/features/chat/view/widgets/chat_message_bubble.dart
import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart';
import 'package:litera_app/features/chat/model/chat_message.dart';

/// Sebuah widget untuk menampilkan satu gelembung pesan dalam chat.
///
/// Widget ini secara otomatis akan mengatur perataan (kanan/kiri) dan warna
/// berdasarkan nilai boolean [isMe].
class ChatMessageBubble extends StatelessWidget {
  /// Objek data pesan yang akan ditampilkan.
  final ChatMessage message;

  /// Menentukan apakah pesan ini dikirim oleh pengguna saat ini.
  /// Jika `true`, bubble akan rata kanan dengan warna primer.
  /// Jika `false`, bubble akan rata kiri dengan warna abu-abu.
  final bool isMe;

  const ChatMessageBubble({
    super.key,
    required this.message,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    // Gunakan Align untuk mendorong bubble ke kanan atau ke kiri.
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        // Margin untuk memberi jarak antar bubble.
        margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        // Padding untuk memberi jarak antara teks dan tepi bubble.
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 14.0),
        decoration: BoxDecoration(
          // Atur warna berdasarkan siapa pengirimnya.
          color: isMe ? Pallete.primaryColor : Colors.grey[200],
          // Atur bentuk sudut bubble agar terlihat seperti aplikasi chat.
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16.0),
            topRight: const Radius.circular(16.0),
            bottomLeft: isMe ? const Radius.circular(16.0) : const Radius.circular(0),
            bottomRight: isMe ? const Radius.circular(0) : const Radius.circular(16.0),
          ),
        ),
        child: Text(
          message.text,
          // Atur warna teks agar kontras dengan background bubble.
          style: TextStyle(color: isMe ? Colors.white : Colors.black87),
        ),
      ),
    );
  }
}