import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:litera_app/core/theme/app_pallete.dart';
import '../../models/booking_model.dart';

class RentalDetailsCard extends StatelessWidget {
  final BookingModel details;
  const RentalDetailsCard({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Pallete.secondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _buildDetailRow('Tanggal Pinjam :', DateFormat('dd-MM-yyyy').format(details.startDate)),
          _buildDetailRow('Durasi :', '${details.durationDays} Hari'),
          _buildDetailRow('Tanggal Kembali :', DateFormat('dd-MM-yyyy').format(details.endDate)),
          _buildDetailRow('Harga Peminjaman :', NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0).format(details.pricePerDay)),
          const Divider(height: 20),
          _buildDetailRow('Total :', NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0).format(details.totalPrice), isTotal: true),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Colors.grey.shade700)),
          Text(value, style: TextStyle(fontWeight: isTotal ? FontWeight.bold : FontWeight.normal, fontSize: isTotal ? 16 : 14)),
        ],
      ),
    );
  }
}