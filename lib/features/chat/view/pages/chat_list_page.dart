// lib/features/chat/view/pages/chat_list_page.dart
import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart';
import 'package:litera_app/features/chat/model/loan_offer.dart';
import 'package:litera_app/features/chat/view/pages/chat_page.dart';

class ChatListPage extends StatelessWidget {
  const ChatListPage({super.key});

  @override
  Widget build(BuildContext context) {
    // --- ID PENGGUNA YANG SEDANG LOGIN ---
    // Di sini, kita anggap yang sedang login adalah PEMILIK BUKU
    const String ownerUserId = 'pemilik_789';

    // --- DATA DUMMY DAFTAR TAWARAN YANG MASUK UNTUK PEMILIK ---
    // Nantinya ini didapat dari API
    final List<LoanOffer> incomingOffers = [
      LoanOffer(
        offerId: 'offer_abc',
        durationDays: 15,
        totalPrice: 15000,
        status: LoanStatus.waiting,
        createdAt: DateTime.now().subtract(const Duration(hours: 1)),
        bookId: 'bk_123',
        bookTitle: 'Bumi Manusia',
        bookOwnerId: ownerUserId, // ID pemilik sama dengan yang login
        bookImageUrl: 'https://ui-avatars.com/api/?name=Bumi+Manusia&size=250&background=random&color=fff&font-size=0.3',
        pricePerDay: 1000,
        borrowerId: 'peminjam_001', // ID peminjam
      ),
      LoanOffer(
        offerId: 'offer_def',
        durationDays: 7,
        totalPrice: 3500,
        status: LoanStatus.waiting,
        createdAt: DateTime.now().subtract(const Duration(days: 2)),
        bookId: 'bk_456',
        bookTitle: 'Laut Bercerita',
        bookOwnerId: ownerUserId, // ID pemilik sama dengan yang login
        bookImageUrl: 'https://ui-avatars.com/api/?name=Laut+Bercerita&size=250&background=random&color=fff&font-size=0.3',
        pricePerDay: 500,
        borrowerId: 'peminjam_002', // ID peminjam lain
      ),
    ];
    // --- AKHIR DATA DUMMY ---

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tawaran Masuk"),
        backgroundColor: Pallete.primaryColor,
      ),
      body: ListView.builder(
        itemCount: incomingOffers.length,
        itemBuilder: (context, index) {
          final offer = incomingOffers[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage('https://ui-avatars.com/api/?name=${offer.borrowerId.replaceAll('_', '+')}'),
            ),
            title: Text('Tawaran dari: ${offer.borrowerId}'),
            subtitle: Text('Untuk buku: ${offer.bookTitle}'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Saat di-tap, buka ChatPage
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatPage(
                    offer: offer,
                    // PENTING: Kirim ID pemilik sebagai pengguna saat ini
                    currentUserId: ownerUserId, 
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}