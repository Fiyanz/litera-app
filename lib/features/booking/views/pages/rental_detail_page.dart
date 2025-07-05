import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart';
import 'package:litera_app/features/booking/viewmodels/rental_detail_viewmodel.dart';
import 'package:provider/provider.dart';

// Import semua komponen yang dibutuhkan
import '../widgets/book_details_header.dart';
import '../widgets/owner_info_tile.dart';
import '../widgets/photo_upload_card.dart';
import '../widgets/progress_timeline.dart';
import '../widgets/rental_details_card.dart';

class RentalDetailPage extends StatelessWidget {
  const RentalDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Menyediakan ViewModel untuk halaman ini dan semua widget di dalamnya
    return ChangeNotifierProvider(
      create: (_) => RentalDetailViewModel(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Detail Peminjaman')),
        // Consumer digunakan agar UI dapat update saat ada perubahan di ViewModel
        body: Consumer<RentalDetailViewModel>(
          builder: (context, viewModel, child) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1. Widget untuk detail buku di bagian atas
                  BookDetailsHeader(details: viewModel.bookingDetails),
                  const SizedBox(height: 16),

                  // 2. Widget untuk informasi pemilik
                  OwnerInfoTile(details: viewModel.bookingDetails),
                  const SizedBox(height: 24),

                  // 3. Bagian Konfirmasi Foto
                  const Text('Konfirmasi Peminjaman', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  
                  // Widget untuk upload foto dari peminjam
                  PhotoUploadCard(
                    title: 'Foto dari Peminjam',
                    subtitle: 'Upload foto ketika menerima buku',
                    photoFile: viewModel.borrowerPhoto,
                    onTap: viewModel.pickBorrowerPhoto,
                    actionText: 'Tap untuk upload foto',
                    isEnabled: viewModel.currentProgress == RentalProgress.awaitingPickup,
                  ),
                  const SizedBox(height: 16),
                  
                  // Widget untuk upload foto dari pemilik (simulasi)
                  PhotoUploadCard(
                    title: 'Foto dari Pemilik',
                    subtitle: 'Upload foto ketika menerima buku',
                    photoFile: viewModel.ownerPhoto,
                    onTap: () {}, // Tidak ada aksi untuk peminjam
                    actionText: 'Menunggu konfirmasi pengembalian',
                    isEnabled: false,
                  ),
                  const SizedBox(height: 24),

                  // 4. Widget untuk timeline progres peminjaman
                  ProgressTimeline(currentProgress: viewModel.currentProgress),
                  
                  const SizedBox(height: 24),

                  // 5. Widget untuk rincian biaya dan tanggal
                  RentalDetailsCard(details: viewModel.bookingDetails),
                ],
              ),
            );
          },
        ),
        // Tombol di bagian bawah halaman
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<RentalDetailViewModel>(
            builder: (context, viewModel, child) {
              // Teks tombol berubah sesuai progres
              final buttonText = viewModel.currentProgress == RentalProgress.bookWithBorrower
                  ? 'Selesaikan Peminjaman'
                  : 'Update';
              
              // Tombol dinonaktifkan jika progres sudah selesai
              final isButtonEnabled = viewModel.currentProgress != RentalProgress.rentalComplete;

              return ElevatedButton(
                onPressed: isButtonEnabled ? () => viewModel.updateProgress(context) : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Pallete.primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  disabledBackgroundColor: Colors.grey, // Warna saat nonaktif
                ),
                child: Text(buttonText, style: const TextStyle(fontSize: 18, color: Colors.white)),
              );
            },
          ),
        ),
      ),
    );
  }
}