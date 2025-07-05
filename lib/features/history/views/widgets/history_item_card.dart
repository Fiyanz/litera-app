import 'package:flutter/material.dart';
import 'package:litera_app/features/booking/views/pages/rental_detail_page.dart';
import 'package:litera_app/features/history/viewmodels/history_viewmodel.dart';
import 'package:provider/provider.dart';
import '../../models/history_model.dart';
import 'status_badge.dart';

class HistoryItemCard extends StatelessWidget {
  final HistoryModel history;
  const HistoryItemCard({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<HistoryViewModel>();
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      shadowColor: Colors.grey.withOpacity(0.2),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Book Cover
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                history.bookImageUrl,
                width: 80,
                height: 120,
                fit: BoxFit.cover,
                // errorBuilder akan dipanggil jika gambar gagal dimuat
                errorBuilder: (context, error, stackTrace) {
                  // Kembalikan widget pengganti di sini
                  return Container(
                    width: 80,
                    height: 120,
                    color: Colors.grey.shade200, // Warna latar belakang
                    child: Center(
                      child: Text(
                        // Ambil huruf pertama dari judul buku
                        history.bookTitle.isNotEmpty ? history.bookTitle.substring(0, 1) : '?',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(width: 12),
            // Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          history.bookTitle, 
                          style: const TextStyle(
                            fontSize: 16, 
                            fontWeight: FontWeight.bold
                          ), 
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis
                        ),
                      ),
                      const SizedBox(width: 8),
                      // Status Badge
                      StatusBadge(status: history.status),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(history.bookAuthor, style: TextStyle(fontSize: 14, color: Colors.grey.shade600)),
                  const SizedBox(height: 8),
                  _buildInfoRow(icon: Icons.person, text: history.borrowerName),
                  _buildInfoRow(icon: Icons.calendar_today, text: viewModel.formatDateRange(history.borrowDate, history.returnDate)),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(viewModel.formatPrice(history.price), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.teal)),
                      TextButton.icon(
                        onPressed: () {
                          // Tambahkan navigasi ke halaman detail
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const RentalDetailPage()),
                          );
                        },
                        icon: const Icon(Icons.visibility, size: 16),
                        label: const Text('Detail'),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow({required IconData icon, required String text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        children: [
          Icon(icon, size: 14, color: Colors.grey.shade600),
          const SizedBox(width: 8),
          Text(text, style: TextStyle(fontSize: 12, color: Colors.grey.shade700)),
        ],
      ),
    );
  }
}