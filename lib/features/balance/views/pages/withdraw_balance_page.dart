import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart'; // Sesuaikan path
import 'package:litera_app/features/balance/viewmodels/balance_viewmodel.dart';
import 'package:provider/provider.dart';

class WithdrawBalancePage extends StatelessWidget {
  const WithdrawBalancePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Kita gunakan .read karena hanya perlu memanggil method, tidak perlu rebuild
    final viewModel = context.read<BalanceViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarik Saldo'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildFormCard(context, viewModel),
            const SizedBox(height: 16),
            _buildInfoBox(),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => viewModel.performWithdrawal(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Pallete.primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                child: const Text('Tarik Saldo', style: TextStyle(fontSize: 18, color: Pallete.primaryLightColor)),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildFormCard(BuildContext context, BalanceViewModel viewModel) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Saldo Tersedia', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 4),
            // Gunakan Consumer di sini agar saldo tersedia ikut terupdate jika ada perubahan
            Consumer<BalanceViewModel>(
              builder: (context, vm, child) {
                return Text(
                  vm.formatCurrency(vm.totalBalance),
                  style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                );
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: viewModel.withdrawAmountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Jumlah Penarikan',
                hintText: 'Masukkan jumlah',
                helperText: 'Minimum penarikan Rp 10.000',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: viewModel.eWalletNameController,
              decoration: const InputDecoration(
                labelText: 'Nama E-Wallet',
                hintText: 'Contoh: GoPay, OVO, DANA, ShopeePay',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: viewModel.eWalletNumberController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Nomor E-Wallet',
                hintText: 'Masukkan nomor e-wallet yang aktif',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
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
          const Text('Informasi Penarikan', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 8),
          _buildInfoRow('> Pastikan nomor e-wallet yang dimasukan aktif'),
          _buildInfoRow('> Proses penarikan melalui QRIS'),
          _buildInfoRow('> Minimun penarikan Rp 10.000'),
          _buildInfoRow('> Tanpa biaya admin'),
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