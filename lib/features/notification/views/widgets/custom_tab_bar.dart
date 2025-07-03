import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart'; // Sesuaikan path

class CustomTabBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabChanged;
  final List<String> tabs = const ['Keuangan', 'Tawaran', 'Buku'];

  const CustomTabBar({
    super.key,
    required this.selectedIndex,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Pallete.secondaryColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: List.generate(tabs.length, (index) {
          final isSelected = selectedIndex == index;
          return Expanded(
            child: GestureDetector(
              onTap: () => onTabChanged(index),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: isSelected ? Pallete.primaryColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    tabs[index],
                    style: TextStyle(
                      color: isSelected ? Pallete.primaryLightColor : Pallete.textGrayColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}