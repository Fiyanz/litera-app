// lib/features/chat/view/widgets/loan_offer_sent_bubble.dart
import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart';
import 'package:litera_app/features/chat/model/loan_offer.dart';

class LoanOfferSentBubble extends StatelessWidget {
  final LoanOffer offer;
  const LoanOfferSentBubble({super.key, required this.offer});

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
                  offer.bookImageUrl,
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
                    const Text('Permintaan pinjam terkirim!',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                    const SizedBox(height: 8),
                    _buildDetailRow('Judul', offer.bookTitle),
                    _buildDetailRow('Durasi', '${offer.durationDays} Hari'),
                    _buildDetailRow('Total', 'Rp ${offer.totalPrice}'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(),
          const SizedBox(height: 8),
          const Align(
            alignment: Alignment.centerRight,
            child: Text('Menunggu konfirmasi pemilik buku...',
                style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic)),
          ),
        ],
      ),
    );
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