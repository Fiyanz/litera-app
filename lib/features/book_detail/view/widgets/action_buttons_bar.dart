import 'package:flutter/material.dart';
import 'package:litera_app/features/book_detail/view/widgets/loan_button_sheet.dart';
import '../../../../core/theme/app_pallete.dart';

class ActionButtonsBar extends StatelessWidget {
  // PERBAIKAN 2: Ganti parameter 'Book book' dengan data individual
  final String bookId;
  final String bookTitle;
  final String bookOwnerId;
  final String bookImageUrl;
  final int pricePerDay;

  const ActionButtonsBar({
    super.key,
    required this.bookId,
    required this.bookTitle,
    required this.bookOwnerId,
    required this.bookImageUrl,
    required this.pricePerDay,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
      child: Row(
        children: [
          // Bookmark Button (tidak berubah)
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Pallete.borderColor),
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: const Icon(Icons.bookmark_border_rounded, size: 28, color: Pallete.textGrayColor),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Buku ditambahkan ke bookmark!')),
                );
              },
            ),
          ),
          const SizedBox(width: 16),
          
          // Loan Button
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Pallete.primaryColor,
                foregroundColor: Pallete.primaryLightColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) {
                    // PERBAIKAN 3: Teruskan data individual ke LoanBottomSheet
                    return LoanBottomSheet(
                      bookId: bookId,
                      bookTitle: bookTitle,
                      bookOwnerId: bookOwnerId,
                      bookImageUrl: bookImageUrl,
                      pricePerDay: pricePerDay,
                    );
                  },
                );
              },
              child: const Text('Pinjam Buku', style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
}