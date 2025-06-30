// lib/features/chat/view/widgets/loan_request_bubble.dart
import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart';
import 'package:litera_app/features/chat/model/loan_offer.dart';

class LoanRequestBubble extends StatefulWidget {
  final LoanOffer offer;
  const LoanRequestBubble({super.key, required this.offer});

  @override
  State<LoanRequestBubble> createState() => _LoanRequestBubbleState();
}

class _LoanRequestBubbleState extends State<LoanRequestBubble> {
  late LoanStatus _currentStatus;

  @override
  void initState() {
    super.initState();
    _currentStatus = widget.offer.status;
  }

  void _updateOfferStatus(LoanStatus newStatus) {
    // TODO: Panggil API untuk update status di server
    setState(() {
      _currentStatus = newStatus;
    });
  }

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
                  widget.offer.bookImageUrl,
                  width: 80, height: 120, fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      Container(width: 80, height: 120, color: Colors.grey[300]),
                ),
              ),
              const SizedBox(width: 16),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.offer.borrowerId} ingin meminjam buku Anda!',
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    const SizedBox(height: 8),
                    _buildDetailRow('Judul', widget.offer.bookTitle),
                    _buildDetailRow('Durasi', '${widget.offer.durationDays} Hari'),
                    _buildDetailRow('Sewa', 'Rp ${widget.offer.pricePerDay}/Hari'),
                    _buildDetailRow('Total', 'Rp ${widget.offer.totalPrice}'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(),
          const SizedBox(height: 8),
          _buildActionSection(),
        ],
      ),
    );
  }
  
  Widget _buildActionSection() {
    switch (_currentStatus) {
      case LoanStatus.waiting:
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () => _updateOfferStatus(LoanStatus.rejected),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                side: const BorderSide(color: Pallete.primaryColor),
              ),
              child: const Text('Tolak', style: TextStyle(color: Pallete.primaryColor)),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: () => _updateOfferStatus(LoanStatus.accepted),
              style: ElevatedButton.styleFrom(backgroundColor: Pallete.primaryColor),
              child: const Text('Terima'),
            ),
          ],
        );
      case LoanStatus.accepted:
        return Align(
          alignment: Alignment.centerRight,
          child: Text('Anda menyetujui permintaan ini.',
              style: TextStyle(color: Colors.green[700], fontWeight: FontWeight.bold)),
        );
      case LoanStatus.rejected:
        return const Align(
          alignment: Alignment.centerRight,
          child: Text('Anda menolak permintaan ini.',
              style: TextStyle(color: Pallete.errorColor, fontWeight: FontWeight.bold)),
        );
    }
  }

  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        children: [
          SizedBox(width: 50, child: Text('$title:', style: const TextStyle(color: Colors.grey))),
          const SizedBox(width: 8),
          Expanded(child: Text(value, style: const TextStyle(fontWeight: FontWeight.w500))),
        ],
      ),
    );
  }
}