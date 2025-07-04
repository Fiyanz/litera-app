import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart';
import 'package:litera_app/features/balance/viewmodels/balance_viewmodel.dart';
import 'package:provider/provider.dart';
import '../widgets/total_balance_card.dart';
import '../widgets/transaction_item_tile.dart';

class BalancePage extends StatelessWidget {
  const BalancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BalanceViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Saldo'),
        ),
        body: Consumer<BalanceViewModel>(
          builder: (context, viewModel, child) {
            return Column(
              children: [
                // Kartu Total Saldo
                TotalBalanceCard(
                  formattedBalance: viewModel.formatCurrency(viewModel.totalBalance),
                ),
                
                // Tab Filter
                _buildFilterTabs(context, viewModel),
                
                // Daftar Transaksi
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.only(top: 8),
                    itemCount: viewModel.filteredTransactions.length,
                    itemBuilder: (context, index) {
                      final transaction = viewModel.filteredTransactions[index];
                      return TransactionItemTile(
                        transaction: transaction,
                        formattedAmount: viewModel.formatCurrency(transaction.amount),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  // Helper untuk membuat tab filter
  Widget _buildFilterTabs(BuildContext context, BalanceViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ToggleButtons(
        onPressed: (index) => viewModel.changeTab(index),
        isSelected: [
          viewModel.selectedTabIndex == 0,
          viewModel.selectedTabIndex == 1,
        ],
        borderRadius: BorderRadius.circular(30),
        selectedColor: Pallete.primaryLightColor,
        fillColor: Pallete.primaryColor,
        constraints: BoxConstraints(
          minHeight: 40.0,
          minWidth: (MediaQuery.of(context).size.width - 36) / 2,
        ),
        children: const [
          Text('Saldo Masuk'),
          Text('Saldo Keluar'),
        ],
      ),
    );
  }
}