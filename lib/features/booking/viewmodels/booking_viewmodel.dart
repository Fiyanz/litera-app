import 'package:flutter/material.dart';
import 'package:litera_app/features/booking/views/pages/payment_page.dart';
import 'package:litera_app/features/booking/views/pages/payment_success_page.dart';
import 'package:provider/provider.dart';
import '../models/booking_model.dart';

// Enum untuk pilihan agar kode lebih aman dan terbaca
enum PaymentMethod { qris }
enum PickupMethod { cod, inPlace }

class BookingViewModel extends ChangeNotifier {
  late BookingModel bookingDetails;

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

  // Method ini mengarahkan ke halaman pembayaran
  void navigateToPayment(BuildContext context) {
    if (_selectedPaymentMethod == null || _selectedPickupMethod == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Harap pilih metode pembayaran dan pengambilan.'), backgroundColor: Colors.red),
      );
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ChangeNotifierProvider.value(
          value: this,
          child: const PaymentPage(),
        ),
      ),
    );
  }

  // Method ini dipanggil dari PaymentPage untuk menyelesaikan proses
  void confirmFinalPayment(BuildContext context) {
    print('Pembayaran dikonfirmasi, menyelesaikan pesanan...');

    // Siapkan data yang akan dikirim
    final bookingData = bookingDetails;
    final pickupMethod = _selectedPickupMethod!;

    // Navigasi ke halaman sukses sambil mengirim data secara langsung
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (_) => PaymentSuccessPage(
          bookingDetails: bookingData,
          selectedPickupMethod: pickupMethod,
        ),
      ),
      (route) => route.isFirst,
    );
  }

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