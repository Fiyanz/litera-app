// lib/features/booking/view/widgets/payment_method_selector.dart
import 'package:flutter/material.dart';
import 'package:litera_app/features/booking/viewmodels/booking_viewmodel.dart';
import 'package:provider/provider.dart';
import 'selectable_option_tile.dart';

class PaymentMethodSelector extends StatelessWidget {
  const PaymentMethodSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<BookingViewModel>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
            const Icon(Icons.payment, color: Colors.orange, size: 20),
            const SizedBox(width: 8),
            const Text('Metode Pembayaran', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ]),
        const SizedBox(height: 8),
        SelectableOptionTile<PaymentMethod>(
          title: 'QRIS',
          subtitle: 'Bayar tunai saat bertemu dengan pemilik buku',
          leadingIcon: Icons.qr_code,
          value: PaymentMethod.qris,
          groupValue: viewModel.selectedPaymentMethod,
          onChanged: (val) => viewModel.selectPaymentMethod(val),
        ),
      ],
    );
  }
}
