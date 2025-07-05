import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart';
import 'package:litera_app/features/booking/viewmodels/booking_viewmodel.dart';
import 'package:provider/provider.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<BookingViewModel>();
    final String pageTitle = viewModel.selectedPaymentMethod == PaymentMethod.qris
        ? 'Pembayaran QRIS'
        : 'Pembayaran di Tempat';

    return Scaffold(
      appBar: AppBar(title: Text(pageTitle)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: _buildPaymentBody(context, viewModel),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Panggil method konfirmasi final dari ViewModel
            viewModel.confirmFinalPayment(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Pallete.primaryColor,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: const Text('Konfirmasi', style: TextStyle(fontSize: 18, color: Colors.white)),
        ),
      ),
    );
  }

  Widget _buildPaymentBody(BuildContext context, BookingViewModel viewModel) {
    switch (viewModel.selectedPaymentMethod) {
      case PaymentMethod.qris:
        return _buildQrisPaymentBody(context, viewModel);
      default:
        return _buildQrisPaymentBody(context, viewModel);
    }
  }

  Widget _buildQrisPaymentBody(BuildContext context, BookingViewModel viewModel) {
    final details = viewModel.bookingDetails;
    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const Text('Scan QR Code Untuk Pembayaran', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                Image.network(
                  'https://i.ibb.co/GvxG0b2/example-qris.png',
                  width: 250,
                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.error, size: 100, color: Colors.grey),
                ),
                const SizedBox(height: 16),
                const Text('Total Pembayaran', style: TextStyle(color: Colors.grey)),
                Text(
                  'Rp ${details.totalPrice.toStringAsFixed(0)}',
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        Card(
           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
           child: Padding(
             padding: const EdgeInsets.all(16.0),
             child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 const Text('Cara Pembayaran QRIS', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                 const SizedBox(height: 12),
                 _buildInstructionStep('1', 'Buka aplikasi E-wallet dan Bank Anda'),
                 _buildInstructionStep('2', 'Pilih menu "Scan " atau "Bayar"'),
                 _buildInstructionStep('3', 'Scan QR code di atas'),
                 _buildInstructionStep('4', 'Konfirmasi pembayaran Rp ${details.totalPrice.toStringAsFixed(0)}'),
                 _buildInstructionStep('5', 'Screenshot bukti pembayaran'),
               ],
             ),
           ),
        ),
      ],
    );
  }

  Widget _buildInstructionStep(String number, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 12,
            backgroundColor: Pallete.primaryColor,
            child: Text(number, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(width: 12),
          Expanded(child: Text(text, style: TextStyle(color: Colors.grey.shade700))),
        ],
      ),
    );
  }
}