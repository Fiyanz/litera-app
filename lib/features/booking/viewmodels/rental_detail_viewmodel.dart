import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:litera_app/features/booking/views/widgets/rental_step_success_dialog.dart';
// import 'package:image_picker/image_picker.dart'; // Tambahkan package: flutter pub add image_picker
import '../models/booking_model.dart';
import 'dart:io'; // Untuk tipe data File

// Enum untuk merepresentasikan progres peminjaman
enum RentalProgress { awaitingPickup, bookWithBorrower, awaitingReturn, rentalComplete }

class RentalDetailViewModel extends ChangeNotifier {
  late BookingModel bookingDetails;
  
  // State untuk progres timeline
  RentalProgress _currentProgress = RentalProgress.awaitingPickup;
  RentalProgress get currentProgress => _currentProgress;

  // State untuk foto
  File? _borrowerPhoto; // Foto yang diupload peminjam
  File? get borrowerPhoto => _borrowerPhoto;

  // state untuk foto pemilik
  File? _ownerPhoto;
  File? get ownerPhoto => _ownerPhoto;

  RentalDetailViewModel() {
    _fetchBookingDetails();
  }

  // Method untuk mengambil foto dari galeri/kamera
  Future<void> pickBorrowerPhoto() async {
    // Logika image_picker akan ada di sini
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _borrowerPhoto = File(pickedFile.path);
      notifyListeners();
    }
    print('Fungsi pilih foto dijalankan...');
    // Untuk demo, kita pura-pura berhasil upload
    _borrowerPhoto = File('path/to/fake/image.jpg'); // Placeholder
    notifyListeners();
  }
  
  // Method untuk tombol "Update"
  void updateProgress(BuildContext context) {
    // Kondisi saat peminjam upload foto
    if (_currentProgress == RentalProgress.awaitingPickup && _borrowerPhoto != null) {
      _currentProgress = RentalProgress.bookWithBorrower;
      // Simulasi pemilik langsung upload foto setelahnya
      _ownerPhoto = File('path/to/fake/owner_image.jpg'); 
      print('Progress diupdate ke: $_currentProgress. Menunggu konfirmasi pengembalian.');
      notifyListeners();
      return;
    }

    // Kondisi saat buku sudah selesai dipinjam dan dikembalikan
    if (_currentProgress == RentalProgress.bookWithBorrower && _ownerPhoto != null) {
       _currentProgress = RentalProgress.rentalComplete;
       notifyListeners();
       // Tampilkan dialog sukses
       showDialog(
        context: context,
        builder: (context) => const RentalStepSuccessDialog(),
       );
       print('Penyewaan selesai!');
    }
  }

  // Method untuk mengambil data awal
  void _fetchBookingDetails() {
    bookingDetails = BookingModel(
      bookTitle: 'Laut Bercerita',
      bookAuthor: 'Oleh Leila S. Chudori',
      bookImageUrl: 'https://i.ibb.co/6PZHy1N/laut-bercerita.jpg',
      isbn: 'ISBN 978-602-424-694-5',
      year: 'Tahun : 2017',
      pricePerDay: 500,
      ownerName: 'Kanye',
      ownerImageUrl: 'https://i.pravatar.cc/150?img=68',
      ownerLocation: 'Kebumen, Jawa Tengah',
      startDate: DateTime(2025, 5, 8),
      durationDays: 15,
      endDate: DateTime(2025, 5, 23),
      totalPrice: 7500,
    );
  }
}