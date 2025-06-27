import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart';

class FilterDialog extends StatefulWidget {
  // 1. TERIMA DATA DARI LUAR
  final List<String> years;
  final List<String> locations;
  final List<String> categories;

  const FilterDialog({
    super.key,
    required this.years,
    required this.locations,
    required this.categories,
  });

  @override
  State<FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  // Variabel untuk menyimpan nilai yang dipilih
  String? _selectedYear;
  String? _selectedLocation;
  String? _selectedCategory;

  // HAPUS DATA DUMMY DARI SINI

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _buildDialogContent(context),
    );
  }

  Widget _buildDialogContent(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // 2. GUNAKAN DATA DARI WIDGET
              Expanded(child: _buildDropdown(widget.years, 'Tahun', _selectedYear, (val) => setState(() => _selectedYear = val))),
              const SizedBox(width: 10),
              Expanded(child: _buildDropdown(widget.locations, 'Lokasi', _selectedLocation, (val) => setState(() => _selectedLocation = val))),
              const SizedBox(width: 10),
              Expanded(child: _buildDropdown(widget.categories, 'Kategori', _selectedCategory, (val) => setState(() => _selectedCategory = val))),
            ],
          ),
          const SizedBox(height: 24.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Pallete.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
            ),
            onPressed: () {
              final result = {
                'year': _selectedYear ?? '',
                'location': _selectedLocation ?? '',
                'category': _selectedCategory ?? '',
              };
              Navigator.of(context).pop(result);
            },
            child: const Text(
              'Cari',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown(List<String> items, String hint, String? value, ValueChanged<String?> onChanged) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          hint: Text(
            hint, 
            style: TextStyle(color: Colors.grey.shade600),
            overflow: TextOverflow.ellipsis,
          ),
          value: value,
          icon: const Icon(Icons.arrow_drop_down),
          // Pastikan item tidak kosong untuk menghindari error
          items: items.isNotEmpty
              ? items.map<DropdownMenuItem<String>>((String val) {
                  return DropdownMenuItem<String>(
                    value: val,
                    child: Text(val),
                  );
                }).toList()
              : [], // Jika kosong, berikan list kosong
          onChanged: onChanged,
        ),
      ),
    );
  }
}
