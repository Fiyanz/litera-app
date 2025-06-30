// lib/features/book_detail/view/widgets/book_image_slider.dart
import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart';

/// Sebuah widget yang menampilkan galeri gambar yang bisa di-swipe (slider)
/// menggunakan PageView, lengkap dengan indikator halaman di bawahnya.
class BookImageSlider extends StatefulWidget {
  final List<String> imageUrls;
  const BookImageSlider({super.key, required this.imageUrls});

  @override
  State<BookImageSlider> createState() => _BookImageSliderState();
}

class _BookImageSliderState extends State<BookImageSlider> {
  // Menyimpan indeks halaman yang sedang ditampilkan
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    // Slider hanya aktif jika ada lebih dari 1 gambar
    final bool isSliderActive = widget.imageUrls.length > 1;

    // Menangani kasus jika tidak ada gambar sama sekali
    if (widget.imageUrls.isEmpty) {
      return Container(
        height: 250,
        width: 180,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Icon(Icons.book_outlined, color: Colors.grey[400], size: 80),
        ),
      );
    }

    return Column(
      children: [
        // Kontainer utama untuk PageView dengan bayangan
        Container(
          height: 250,
          width: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                spreadRadius: 1,
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: PageView.builder(
            // Atur fisika scroll berdasarkan jumlah gambar
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
                    return Container(
                      color: Colors.grey[200],
                      child: const Center(
                        child: Icon(Icons.error_outline, color: Colors.grey, size: 50),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 16), // Jarak antara slider dan indikator

        // Tampilkan indikator hanya jika slider aktif
        if (isSliderActive)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.imageUrls.length, (index) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
                width: _currentPage == index ? 24 : 8, // Titik aktif lebih panjang
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: _currentPage == index ? Pallete.primaryColor : Colors.grey.shade300,
                ),
              );
            }),
          ),
      ],
    );
  }
}