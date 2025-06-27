import 'package:flutter/material.dart';
import 'package:litera_app/core/models/book_model.dart';
import 'package:litera_app/core/theme/app_pallete.dart';
import 'package:litera_app/features/chat/view/pages/chat_page.dart';

class LoanBottomSheet extends StatefulWidget {
  // PERBAIKAN 2: Deklarasikan bahwa widget ini menerima objek Book
  final Book book;

  const LoanBottomSheet({super.key, required this.book});

  @override
  State<LoanBottomSheet> createState() => _LoanBottomSheetState();
}

class _LoanBottomSheetState extends State<LoanBottomSheet> {
  int _dayCount = 15;
  // PERBAIKAN 3: Harga per hari bisa diambil dari data buku jika ada
  late final int _pricePerDay;
  final int _maxDays = 30;

  @override
  void initState() {
    super.initState();
    // Gunakan harga dari buku, atau fallback ke harga default
    _pricePerDay = widget.book.pricePerDay ?? 500;
  }

  void _incrementDays() {
    if (_dayCount < _maxDays) {
      setState(() {
        _dayCount++;
      });
    }
  }

  void _decrementDays() {
    if (_dayCount > 1) {
      setState(() {
        _dayCount--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final total = _dayCount * _pricePerDay;

    return Container(
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 32),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  // PERBAIKAN 4: Gunakan URL gambar dari objek buku
                  widget.book.imageUrls.isNotEmpty ? widget.book.imageUrls[0] : 'https://via.placeholder.com/150',
                  width: 60,
                  height: 90,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      Container(width: 60, height: 90, color: Colors.grey.shade200),
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // PERBAIKAN 5: Gunakan judul dari objek buku
                    widget.book.title,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Rp $_pricePerDay/hari',
                    style: const TextStyle(fontSize: 14, color: Pallete.textGrayColor),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              const Text('Jumlah Hari:', style: TextStyle(fontSize: 16)),
              const Spacer(),
              _buildDaySelector(),
            ],
          ),
          // ... sisa widget (note batas maksimal & divider) ...
          const SizedBox(height: 24),
          const Divider(),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Total:', style: TextStyle(color: Pallete.textGrayColor)),
                  Text(
                    'Rp $total',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Pallete.primaryColor,
                    ),
                  )
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  // PERBAIKAN 6: Perbaiki logika navigasi
                  
                  // 1. Tutup bottom sheet terlebih dahulu
                  Navigator.of(context).pop(); 
                  
                  // 2. Kemudian, navigasi ke halaman chat
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      // 3. Kirim semua data yang relevan ke ChatPage
                      builder: (context) => ChatPage(
                        book: widget.book,
                        loanDuration: _dayCount,
                        totalPrice: total,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Pallete.primaryColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Pinjam', style: TextStyle(fontSize: 16)),
              )
            ],
          )
        ],
      ),
    );
  }

  // Widget _buildDaySelector tidak berubah
  Widget _buildDaySelector() {
    // ... implementasi sama seperti sebelumnya
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          IconButton(onPressed: _decrementDays, icon: const Icon(Icons.remove, size: 20), splashRadius: 20, constraints: const BoxConstraints()),
          Text('$_dayCount', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          IconButton(onPressed: _incrementDays, icon: const Icon(Icons.add, size: 20), splashRadius: 20, constraints: const BoxConstraints()),
        ],
      ),
    );
  }
}