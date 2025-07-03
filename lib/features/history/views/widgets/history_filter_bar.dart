import 'package:flutter/material.dart';

class HistoryFilterBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onFilterSelected;
  final List<String> filters = const ['Semua', 'Dipinjam', 'Selesai', 'Terlambat'];

  const HistoryFilterBar({
    super.key,
    required this.selectedIndex,
    required this.onFilterSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(filters.length, (index) {
          final isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () => onFilterSelected(index),
            child: Text(
              filters[index],
              style: TextStyle(
                fontSize: 16,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? Colors.black : Colors.grey.shade600,
              ),
            ),
          );
        }),
      ),
    );
  }
}