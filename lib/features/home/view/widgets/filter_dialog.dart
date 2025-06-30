// lib/features/home/view/widgets/filter_dialog.dart
import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart';

/// Sebuah dialog kustom yang menampilkan beberapa DropdownButton untuk memfilter data.
///
/// Widget ini menerima daftar opsi untuk tahun, lokasi, dan kategori.
/// Saat tombol 'Cari' ditekan, ia akan mengembalikan Map yang berisi
/// nilai-nilai yang dipilih melalui `Navigator.pop(result)`.
class FilterDialog extends StatefulWidget {
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
  // Variabel state untuk menyimpan nilai dropdown yang sedang dipilih.
  String? _selectedYear;
  String? _selectedLocation;
  String? _selectedCategory;

  /// Method untuk membersihkan semua filter yang dipilih.
  void _resetFilters() {
    setState(() {
      _selectedYear = null;
      _selectedLocation = null;
      _selectedCategory = null;
    });
  }

  /// Method untuk mengirim hasil filter dan menutup dialog.
  void _applyFilters() {
    final result = {
      'year': _selectedYear ?? '',
      'location': _selectedLocation ?? '',
      'category': _selectedCategory ?? '',
    };
    Navigator.of(context).pop(result);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _buildDialogContent(context),
    );
  }

  Widget _buildDialogContent(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Membuat tinggi dialog menyesuaikan konten
        children: <Widget>[
          // PENAMBAHAN: Judul Dialog
          const Text(
            'Filter Pencarian',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(child: _buildDropdown(widget.years, 'Tahun', _selectedYear, (val) => setState(() => _selectedYear = val))),
              const SizedBox(width: 10),
              Expanded(child: _buildDropdown(widget.locations, 'Lokasi', _selectedLocation, (val) => setState(() => _selectedLocation = val))),
              const SizedBox(width: 10),
              Expanded(child: _buildDropdown(widget.categories, 'Kategori', _selectedCategory, (val) => setState(() => _selectedCategory = val))),
            ],
          ),
          const SizedBox(height: 32.0),
          // PENAMBAHAN: Tombol Reset dan Tombol Cari dalam satu baris
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: _resetFilters,
                child: const Text('Reset', style: TextStyle(color: Pallete.textGrayColor)),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Pallete.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                ),
                onPressed: _applyFilters,
                child: const Text(
                  'Cari',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Helper method untuk membangun satu widget DropdownButton yang sudah digayakan.
  Widget _buildDropdown(List<String> items, String hint, String? value, ValueChanged<String?> onChanged) {
    return Container(
      height: 50, // Memberi tinggi yang konsisten untuk semua dropdown
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          hint: Text(hint, style: TextStyle(color: Colors.grey.shade600), overflow: TextOverflow.ellipsis),
          value: value,
          icon: const Icon(Icons.arrow_drop_down),
          items: items.map<DropdownMenuItem<String>>((String val) {
            return DropdownMenuItem<String>(
              value: val,
              child: Text(val),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}