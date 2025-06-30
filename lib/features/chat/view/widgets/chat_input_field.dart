// lib/features/chat/view/widgets/chat_input_field.dart
import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart';

class ChatInputField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSendPressed;

  const ChatInputField({
    super.key,
    required this.controller,
    required this.onSendPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // Padding untuk area aman (safe area) di bagian bawah layar
      padding: EdgeInsets.fromLTRB(12.0, 8.0, 12.0, MediaQuery.of(context).padding.bottom + 8.0),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Bisa ditambahkan tombol untuk attachment di sini jika perlu
          // IconButton(icon: Icon(Icons.add), onPressed: () {}),

          // Input field utama
          Expanded(
            child: TextField(
              controller: controller,
              minLines: 1,
              maxLines: 5, // Izinkan input field untuk membesar hingga 5 baris
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                hintText: 'Tulis pesan...',
                filled: true,
                fillColor: Colors.grey[100],
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 20.0,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8.0),

          // Tombol Kirim
          FloatingActionButton(
            onPressed: onSendPressed,
            backgroundColor: Pallete.primaryColor,
            elevation: 1,
            mini: true, // Membuat tombol lebih kecil dan ringkas
            child: const Icon(Icons.send, color: Colors.white, size: 20),
          ),
        ],
      ),
    );
  }
}