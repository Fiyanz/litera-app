import 'package:flutter/material.dart';
import 'package:litera_app/core/models/book_model.dart';
import 'package:litera_app/core/theme/app_pallete.dart';

enum LoanStatus { waiting, accepted, rejected }

class LoanRequestBubble extends StatefulWidget {
  final Book book;
  final int duration;
  final int pricePerDay;
  final int totalPrice;

  const LoanRequestBubble({
    super.key,
    required this.book,
    required this.duration,
    required this.pricePerDay,
    required this.totalPrice,
  });

  @override
  State<LoanRequestBubble> createState() => _LoanRequestBubbleState();
}

class _LoanRequestBubbleState extends State<LoanRequestBubble> {
  LoanStatus _currentStatus = LoanStatus.waiting;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Pallete.secondaryColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  widget.book.imageUrls.isNotEmpty ? widget.book.imageUrls[0] : '', // URL dikosongkan jika tidak ada
                  width: 80,
                  height: 120,
                  fit: BoxFit.cover,
                  // Error builder yang lebih baik, tidak bergantung pada koneksi internet
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 80,
                      height: 120,
                      color: Colors.grey[300],
                      child: const Icon(Icons.book, color: Colors.grey),
                    );
                  },
                ),
              ),
              const SizedBox(width: 16),
              Flexible( 
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Kanyest ingin meminjam buku Anda!',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Pallete.textColor,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _buildDetailRow('Judul', widget.book.title),
                    _buildDetailRow('Durasi', '${widget.duration} Hari'),
                    _buildDetailRow('Sewa', 'Rp ${widget.pricePerDay}/Hari'),
                    _buildDetailRow('Total', 'Rp ${widget.totalPrice}'),
                  ],
                ),
              ),
              // =================================================================
            ],
          ),
          const SizedBox(height: 12),
          if (_currentStatus == LoanStatus.waiting)
            const Text(
              'Silakan konfirmasi untuk menyetujui atau menolak permintaan ini.',
              style: TextStyle(color: Pallete.textGrayColor, fontSize: 13),
            ),
          const SizedBox(height: 16),
          _buildActionSection(),
        ],
      ),
    );
  }

  Widget _buildActionSection() {
    // ... (kode untuk _buildActionSection tidak berubah, biarkan seperti yang sudah ada)
     switch (_currentStatus) {
      case LoanStatus.waiting:
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () => setState(() => _currentStatus = LoanStatus.rejected),
              style: ElevatedButton.styleFrom(
                backgroundColor: Pallete.primaryLightColor,
                side: const BorderSide(color: Pallete.primaryColor),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
              child: const Text('Tolak', style: TextStyle(color: Pallete.primaryColor)),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: () => setState(() => _currentStatus = LoanStatus.accepted),
              style: ElevatedButton.styleFrom(
                backgroundColor: Pallete.primaryColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
              child: const Text('Terima', style: TextStyle(color: Pallete.primaryLightColor)),
            ),
          ],
        );
      case LoanStatus.accepted:
        return Align(
          alignment: Alignment.centerRight,
          child: Text(
            'Permintaan disetujui.',
            style: TextStyle(color: Colors.green[700], fontWeight: FontWeight.bold),
          ),
        );
      case LoanStatus.rejected:
        return const Align(
          alignment: Alignment.centerRight,
          child: Text(
            'Permintaan ditolak.',
            style: TextStyle(color: Pallete.errorColor, fontWeight: FontWeight.bold),
          ),
        );
    }
  }

  Widget _buildDetailRow(String title, String value) {
    // ... (kode untuk _buildDetailRow tidak berubah, biarkan seperti yang sudah ada)
     return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 50,
            child: Text(
              '$title:',
              style: const TextStyle(color: Pallete.textGrayColor, fontSize: 13),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(color: Pallete.textColor, fontSize: 13, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}