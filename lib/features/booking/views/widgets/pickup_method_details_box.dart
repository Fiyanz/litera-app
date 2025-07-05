import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart';

class PickupMethodDetailsBox extends StatelessWidget {
  const PickupMethodDetailsBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Pallete.secondaryColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'COD (Bertemu Langsung)',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          _buildInfoRow('> Koordinasi waktu dan tempat bertemu dengan pemilik'),
          _buildInfoRow('> Pembayaran dilakukan saat bertemu'),
          _buildInfoRow('> Tempat yang disarankan : mall, cafe atau tempat umum'),
          _buildInfoRow('> Konfirmasi kedatangan H-1 sebelum bertemu'),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Text(text, style: TextStyle(color: Colors.grey.shade700)),
    );
  }
}