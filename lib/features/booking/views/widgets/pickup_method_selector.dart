import 'package:flutter/material.dart';
import 'package:litera_app/features/booking/viewmodels/booking_viewmodel.dart';
import 'package:provider/provider.dart';
import 'selectable_option_tile.dart';

class PickupMethodSelector extends StatelessWidget {
  const PickupMethodSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<BookingViewModel>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          const Icon(Icons.rocket_launch, color: Colors.orange, size: 20),
          const SizedBox(width: 8),
          const Text('Metode Pengambilan Buku', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ]),
        const SizedBox(height: 8),
        SelectableOptionTile<PickupMethod>(
          title: 'COD (Bertemu Langsung)',
          subtitle: 'Pemilik dan peminjam bertemu di tempat yang disepakati',
          leadingIcon: Icons.people,
          value: PickupMethod.cod,
          groupValue: viewModel.selectedPickupMethod,
          onChanged: (val) => viewModel.selectPickupMethod(val),
        ),
        SelectableOptionTile<PickupMethod>(
          title: 'Ambil di Tempat',
          subtitle: 'Peminjam datang ke rumah pemilik buku',
          leadingIcon: Icons.home_work,
          value: PickupMethod.inPlace,
          groupValue: viewModel.selectedPickupMethod,
          onChanged: (val) => viewModel.selectPickupMethod(val),
        ),
      ],
    );
  }
}