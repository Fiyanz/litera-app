import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart';

class BookImageSlider extends StatefulWidget {
  final List<String> imageUrls;
  const BookImageSlider({super.key, required this.imageUrls});

  @override
  State<BookImageSlider> createState() => _BookImageSliderState();
}

class _BookImageSliderState extends State<BookImageSlider> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final bool isSliderActive = widget.imageUrls.length > 1;

    return Column(
      children: [
        Container(
          height: 250,
          width: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: PageView.builder(
            physics: isSliderActive
                ? const AlwaysScrollableScrollPhysics()
                : const NeverScrollableScrollPhysics(),
            onPageChanged: (value) {
              setState(() {
                _currentPage = value;
              });
            },
            itemCount: widget.imageUrls.length,
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  widget.imageUrls[index],
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.book, size: 100, color: Pallete.textGrayColor);
                  },
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 8),

        if (isSliderActive)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.imageUrls.length, (index) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: _currentPage == index ? 16 : 8, // Lebar untuk titik aktif diperbesar
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 3),
                decoration: BoxDecoration(
                  // --- PERBAIKAN UTAMA ADA DI SINI ---
                  // Kita tidak lagi menggunakan properti 'shape'.
                  // Bentuk sekarang dikontrol sepenuhnya oleh borderRadius.
                  // Untuk lingkaran, radius = setengah dari lebar/tinggi (8 / 2 = 4)
                  // Untuk persegi panjang melengkung, radius lebih besar.
                  borderRadius: BorderRadius.circular(_currentPage == index ? 5 : 4),
                  color: _currentPage == index ? Pallete.primaryColor : Colors.grey.shade300,
                ),
              );
            }),
          ),
      ],
    );
  }
}
