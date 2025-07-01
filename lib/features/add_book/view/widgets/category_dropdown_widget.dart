import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart'; // Sesuaikan path

class CategoryDropdownWidget extends StatelessWidget {
  final String? selectedValue;
  final List<String> items;
  final void Function(String?)? onChanged;

  const CategoryDropdownWidget({
    super.key,
    required this.selectedValue,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Kategori', style: TextStyle(fontSize: 14, color: Pallete.textGrayColor)),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: selectedValue,
          items: items.map((String category) {
            return DropdownMenuItem<String>(
              value: category,
              child: Text(category),
            );
          }).toList(),
          onChanged: onChanged,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Pallete.borderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Pallete.primaryColor, width: 2),
            ),
            hintText: 'Pilih Kategori',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Kategori tidak boleh kosong';
            }
            return null;
          },
        ),
      ],
    );
  }
}