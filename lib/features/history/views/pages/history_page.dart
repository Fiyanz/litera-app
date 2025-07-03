import 'package:flutter/material.dart';
import 'package:litera_app/features/history/viewmodels/history_viewmodel.dart';
import 'package:provider/provider.dart';
import '../widgets/history_filter_bar.dart';
import '../widgets/history_item_card.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HistoryViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('History', style: TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: Consumer<HistoryViewModel>(
          builder: (context, viewModel, child) {
            return Column(
              children: [
                HistoryFilterBar(
                  selectedIndex: viewModel.selectedFilterIndex,
                  onFilterSelected: (index) => viewModel.changeFilter(index),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: viewModel.filteredHistoryItems.length,
                    itemBuilder: (context, index) {
                      final historyItem = viewModel.filteredHistoryItems[index];
                      return HistoryItemCard(history: historyItem);
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
}