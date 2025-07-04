import 'package:flutter/material.dart';
import '../models/booking_model.dart';

// Enum untuk pilihan agar kode lebih aman dan terbaca
enum PaymentMethod { qris }
enum PickupMethod { cod, inPlace }

class BookingViewModel extends ChangeNotifier {
  late BookingModel bookingDetails;

  // State untuk pilihan pengguna
  PaymentMethod? _selectedPaymentMethod;
  PaymentMethod? get selectedPaymentMethod => _selectedPaymentMethod;

  PickupMethod? _selectedPickupMethod;
  PickupMethod? get selectedPickupMethod => _selectedPickupMethod;

  BookingViewModel() {
    _fetchBookingDetails();
  }

  void selectPaymentMethod(PaymentMethod? method) {
    _selectedPaymentMethod = method;
    notifyListeners();
  }

  void selectPickupMethod(PickupMethod? method) {
    _selectedPickupMethod = method;
    notifyListeners();
  }

  void confirmBooking(BuildContext context) {
    if (_selectedPaymentMethod == null || _selectedPickupMethod == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Harap pilih metode pembayaran dan pengambilan.'), backgroundColor: Colors.red),
      );
      return;
    }
    // TODO: Proses konfirmasi ke backend/API
    print('Booking dikonfirmasi!');
    print('Payment: $_selectedPaymentMethod, Pickup: $_selectedPickupMethod');

    // Navigasi ke halaman sukses atau halaman selanjutnya
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Konfirmasi berhasil!'), backgroundColor: Colors.green),
    );
  }

  void _fetchBookingDetails() {
    bookingDetails = BookingModel(
      bookTitle: 'Laut Bercerita',
      bookAuthor: 'Oleh Leila S. Chudori',
      bookImageUrl: 'https://i.ibb.co/6PZHy1N/laut-bercerita.jpg', // URL gambar yang bisa diakses
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