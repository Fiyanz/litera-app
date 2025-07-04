// lib/features/booking/view/widgets/selectable_option_tile.dart
import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart';

class SelectableOptionTile<T> extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData leadingIcon;
  final T value;
  final T? groupValue;
  final Function(T?) onChanged;

  const SelectableOptionTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.leadingIcon,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: groupValue == value ? Pallete.primaryColor : Colors.grey.shade300),
      ),
      elevation: 0,
      child: ListTile(
        leading: Icon(leadingIcon, color: Pallete.primaryColor),
        
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle, style: const TextStyle(fontSize: 12)),
        
        trailing: Radio<T>(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
          activeColor: Pallete.primaryColor,
        ),

        onTap: () {
          // Jika belum terpilih, panggil onChanged
          if (groupValue != value) {
            onChanged(value);
          }
        },
      ),
    );
  }
}