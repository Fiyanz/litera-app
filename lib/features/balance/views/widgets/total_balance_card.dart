import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart';
import 'package:litera_app/features/balance/viewmodels/balance_viewmodel.dart';
import 'package:litera_app/features/balance/views/pages/withdraw_balance_page.dart';
import 'package:provider/provider.dart'; // Sesuaikan path

class TotalBalanceCard extends StatelessWidget {
  final String formattedBalance;
  const TotalBalanceCard({super.key, required this.formattedBalance});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Pallete.primaryColor, width: 1.5),
      ),
      elevation: 0,
      color: Pallete.primaryColor.withOpacity(0.05),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Total Saldo', style: TextStyle(fontSize: 16, color: Colors.grey)),
            const SizedBox(height: 8),
            Text(
              formattedBalance,
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final viewModel = context.read<BalanceViewModel>();
                  
                  // Navigasi ke halaman Tarik Saldo
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      // Berikan instance ViewModel yang sama ke halaman baru
                      builder: (_) => ChangeNotifierProvider.value(
                        value: viewModel,
                        child: const WithdrawBalancePage(),
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Pallete.primaryColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Text('Tarik Saldo', style: TextStyle(color: Pallete.primaryLightColor, fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}