// lib/features/chat/view/pages/chat_page.dart
import 'package:flutter/material.dart';
import 'package:litera_app/core/models/book_model.dart'; // Pastikan path ini benar
import 'package:litera_app/core/theme/app_pallete.dart';
import 'package:litera_app/features/chat/view/widgets/chat_input_field.dart';
import 'package:litera_app/features/chat/view/widgets/loan_request_bubble.dart';
import 'package:litera_app/features/chat/view/widgets/message_bubble.dart';

class ChatPage extends StatelessWidget {
  final Book book;
  // PERBAIKAN 1: Tambahkan properti untuk menampung durasi dan total harga
  final int loanDuration;
  final int totalPrice;

  // PERBAIKAN 2: Tambahkan parameter ke constructor agar bisa menerima data
  const ChatPage({
    super.key,
    required this.book,
    required this.loanDuration,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Pallete.primaryLightColor,
        leading: const BackButton(color: Pallete.textColor),
        title: const Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nama Peminjam', // Nantinya bisa diganti nama pemilik buku
                  style: TextStyle(
                    color: Pallete.textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Aktif 4 jam lalu',
                  style: TextStyle(
                    color: Pallete.textGrayColor,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert, color: Pallete.textColor),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                // PERBAIKAN 3: Teruskan semua data yang relevan ke LoanRequestBubble
                LoanRequestBubble(
                  book: book,
                  duration: loanDuration,
                  totalPrice: totalPrice,
                  // Mengirim harga per hari, dengan fallback jika null
                  pricePerDay: book.pricePerDay ?? 500,
                ),
                const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                      'Hari ini',
                      style: TextStyle(color: Pallete.textGrayColor),
                    ),
                  ),
                ),
                MessageBubble(
                  // Pesan ini bisa dibuat lebih dinamis nantinya
                  text: 'Membuat tawaran pinjam\n$loanDuration hari',
                  isMe: true,
                ),
              ],
            ),
          ),
          const ChatInputField(),
        ],
      ),
    );
  }
}