import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:litera_app/core/theme/app_pallete.dart';
import 'package:litera_app/features/booking/models/booking_model.dart';
import 'package:litera_app/features/booking/viewmodels/booking_viewmodel.dart';

class PaymentSuccessPage extends StatelessWidget {
  final BookingModel bookingDetails;
  final PickupMethod selectedPickupMethod;

  const PaymentSuccessPage({
    super.key,
    required this.bookingDetails,
    required this.selectedPickupMethod,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pembayaran Berhasil'),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            const Icon(Icons.check_circle, color: Colors.green, size: 80),
            const SizedBox(height: 16),
            const Text(
              'Pembayaran Berhasil',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Peminjaman buku Anda telah dikonfirmasi',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            const SizedBox(height: 24),
            _buildRentalDetails(bookingDetails),
            const SizedBox(height: 24),
            _buildPickupInfo(selectedPickupMethod),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Pallete.primaryColor,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('Hubungi Pemilik Buku', style: TextStyle(fontSize: 16, color: Colors.white)),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
              child: const Text('Kembali Ke Beranda', style: TextStyle(fontSize: 16, color: Pallete.primaryColor)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRentalDetails(BookingModel details) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Pallete.secondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Detail Peminjaman', style: TextStyle(fontWeight: FontWeight.bold)),
          const Divider(height: 20),
          _buildDetailRow('Tanggal Pinjam :', DateFormat('dd-MM-yyyy').format(details.startDate)),
          _buildDetailRow('Durasi :', '${details.durationDays} Hari'),
          _buildDetailRow('Tanggal Kembali :', DateFormat('dd-MM-yyyy').format(details.endDate)),
          _buildDetailRow('Harga Peminjaman :', NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0).format(details.pricePerDay)),
          _buildDetailRow('Total :', NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0).format(details.totalPrice)),
        ],
      ),
    );
  }

  Widget _buildPickupInfo(PickupMethod pickupMethod) {
    final isCod = pickupMethod == PickupMethod.cod;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.location_on_outlined),
                SizedBox(width: 8),
                Text('Informasi Pengambilan', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Pallete.secondaryColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isCod ? 'COD (Bertemu Langsung)' : 'Ambil di Tempat',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    isCod
                        ? 'Koordinasi dengan pemilik untuk menentukan waktu dan tempat bertemu'
                        : 'Silakan datang ke alamat pemilik untuk mengambil buku',
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                   if (isCod) ...[
                    const SizedBox(height: 8),
                    const Text('Tips : Pilih tempat umum seperti mall atau cafe untuk keamanan', style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic)),
                  ]
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Colors.grey.shade700)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}