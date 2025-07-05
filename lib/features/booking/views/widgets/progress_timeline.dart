import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart';
import 'package:litera_app/features/booking/viewmodels/rental_detail_viewmodel.dart';

class ProgressTimeline extends StatelessWidget {
  final RentalProgress currentProgress;
  const ProgressTimeline({super.key, required this.currentProgress});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Progress Peminjaman', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        _buildProgressStep('Peminjam menerima buku', RentalProgress.awaitingPickup, currentProgress),
        _buildProgressStep('Pemilik menerima buku kembali', RentalProgress.bookWithBorrower, currentProgress),
        _buildProgressStep('Pemilik konfirmasi penyewaan selesai', RentalProgress.awaitingReturn, currentProgress),
      ],
    );
  }

  Widget _buildProgressStep(String title, RentalProgress step, RentalProgress current) {
    final isActive = step == current;
    final isCompleted = step.index < current.index;

    // Logika untuk garis vertikal
    Widget buildLine(bool isTop) {
      // Sembunyikan garis di atas step pertama dan di bawah step terakhir
      if ((isTop && step == RentalProgress.awaitingPickup) || (!isTop && step == RentalProgress.awaitingReturn)) {
        return const SizedBox(height: 4);
      }
      return Container(
        width: 2, height: 15,
        color: isCompleted ? Pallete.primaryColor : Colors.grey.shade300,
      );
    }

    return IntrinsicHeight(
      child: Row(
        children: [
          Column(
            children: [
              buildLine(true),
              CircleAvatar(
                radius: 12,
                backgroundColor: isCompleted || isActive ? Pallete.primaryColor : Colors.grey.shade300,
                child: isCompleted
                    ? const Icon(Icons.check, size: 16, color: Colors.white)
                    : CircleAvatar(radius: 4, backgroundColor: isActive ? Colors.white : Colors.grey.shade400),
              ),
              buildLine(false),
            ],
          ),
          const SizedBox(width: 16),
          Text(title, style: TextStyle(fontWeight: isActive ? FontWeight.bold : FontWeight.normal, fontSize: 16)),
        ],
      ),
    );
  }
}