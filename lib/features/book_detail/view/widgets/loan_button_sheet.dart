// lib/features/book_detail/view/widgets/loan_bottom_sheet.dart
import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart';
import 'package:litera_app/features/chat/model/loan_offer.dart';
import 'package:litera_app/features/chat/view/pages/chat_page.dart';

class LoanBottomSheet extends StatefulWidget {
  final String bookId;
  final String bookTitle;
  final String bookOwnerId;
  final String bookImageUrl;
  final int pricePerDay;

  const LoanBottomSheet({
    super.key,
    required this.bookId,
    required this.bookTitle,
    required this.bookOwnerId,
    required this.bookImageUrl,
    required this.pricePerDay,
  });

  @override
  State<LoanBottomSheet> createState() => _LoanBottomSheetState();
}

class _LoanBottomSheetState extends State<LoanBottomSheet> {
  int _dayCount = 15;
  final int _maxDays = 30;

  void _incrementDays() {
    if (_dayCount < _maxDays) setState(() => _dayCount++);
  }

  void _decrementDays() {
    if (_dayCount > 1) setState(() => _dayCount--);
  }

  void _submitOffer(int total) {
    // ID PENGGUNA SAAT INI (DUMMY)
    // Nantinya Anda dapatkan dari state management setelah login
    const String dummyCurrentUserId = 'peminjam_001';

    final newOffer = LoanOffer(
      offerId: DateTime.now().toIso8601String(),
      durationDays: _dayCount,
      totalPrice: total,
      status: LoanStatus.waiting,
      createdAt: DateTime.now(),
      bookId: widget.bookId,
      bookTitle: widget.bookTitle,
      bookOwnerId: widget.bookOwnerId,
      bookImageUrl: widget.bookImageUrl,
      pricePerDay: widget.pricePerDay,
      borrowerId: dummyCurrentUserId,
    );
    
    Navigator.of(context).pop();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ChatPage(
          offer: newOffer,
          currentUserId: dummyCurrentUserId,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final total = _dayCount * widget.pricePerDay;
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
                  widget.bookImageUrl,
                  width: 60, height: 90, fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      Container(width: 60, height: 90, color: Colors.grey.shade200),
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.bookTitle, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text('Rp ${widget.pricePerDay}/hari', style: const TextStyle(fontSize: 14, color: Pallete.textGrayColor)),
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
          const SizedBox(height: 8),
          Center(
            child: Text(
              'Batas maksimal peminjaman $_maxDays hari.',
              style: const TextStyle(fontSize: 12, color: Colors.redAccent),
            ),
          ),
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
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Pallete.primaryColor),
                  )
                ],
              ),
              ElevatedButton(
                onPressed: () => _submitOffer(total),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Pallete.primaryColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Pinjam', style: TextStyle(fontSize: 16)),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildDaySelector() {
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