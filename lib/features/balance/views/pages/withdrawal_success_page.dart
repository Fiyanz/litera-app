import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:litera_app/core/theme/app_pallete.dart'; // Sesuaikan path
import 'package:litera_app/features/balance/models/transaction_model.dart';

class WithdrawalSuccessPage extends StatelessWidget {
  final TransactionModel transaction;
  const WithdrawalSuccessPage({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    final formattedAmount = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0).format(transaction.amount);
    final formattedDate = DateFormat('dd-MM-yyyy').format(transaction.date);

    return Scaffold(
      // Kita tidak menggunakan AppBar di sini
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      const Icon(Icons.check_circle, color: Colors.green, size: 80),
                      const SizedBox(height: 16),
                      const Text('Penarikan Berhasil', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      const Text(
                        'Dana akan segera masuk ke e-wallet Anda\ndalam 1–5 menit',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      const SizedBox(height: 24),
                      _buildDetailsCard(formattedAmount, formattedDate),
                      const SizedBox(height: 16),
                      _buildInfoBox(),
                    ],
                  ),
                ),
              ),
              // Tombol Oke
              ElevatedButton(
                onPressed: () {
                  // Kembali ke halaman Saldo
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Pallete.primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                child: const Text('Oke', style: TextStyle(fontSize: 18, color: Pallete.primaryLightColor)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailsCard(String amount, String date) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildDetailRow('Jumlah Penarikan', amount),
            _buildDetailRow('E-Wallet', transaction.description.replaceAll('ke ', '')), // Ambil nama E-Wallet
            _buildDetailRow('Nomor E-Wallet', '08953452523'), // Contoh nomor
            _buildDetailRow('Tanggal', date),
            _buildDetailRow('Status', 'Berhasil'),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildInfoBox() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Pallete.secondaryColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Pallete.secondaryColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Informasi Penting', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 8),
          _buildInfoRowBullet('> Dana akan masuk ke rekening tujuan dalam 1–5 menit'),
          _buildInfoRowBullet('> Simpan ID transaksi untuk keperluan konfirmasi'),
          _buildInfoRowBullet('> Hubungi customer service jika dana tidak masuk dalam 24 jam'),
          _buildInfoRowBullet('> Penarikan tidak dapat dibatalkan setelah diproses'),
        ],
      ),
    );
  }

  Widget _buildInfoRowBullet(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Text(text, style: TextStyle(color: Colors.grey.shade700)),
    );
  }
}