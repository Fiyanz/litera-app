import 'package:flutter/material.dart';
import '../../../../core/theme/app_pallete.dart'; // Import Pallete Anda
import '../widgets/action_buttons_bar.dart';
import '../widgets/book_info_section.dart';
import '../widgets/loan_status_bar.dart';

class BookDetailPage extends StatefulWidget {
  const BookDetailPage({super.key});

  @override
  State<BookDetailPage> createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Buku'),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Book Cover Image
              Container(
                height: 250,
                width: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Pallete.textColor.withOpacity(0.1), // Menggunakan Pallete
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  // Ganti dengan URL gambar buku dari data Anda
                  child: Image.network(
                    'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1518613149l/38591242.jpg',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(Icons.book, size: 100, color: Pallete.textGrayColor); // Menggunakan Pallete
                    },
                  ),
                ),
              ),
              const SizedBox(height: 8),
              // Dots Indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) => Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index == 0 ? Pallete.primaryColor : Colors.grey.shade300, // Menggunakan Pallete
                  ),
                )),
              ),
              const SizedBox(height: 24),
              
              // Book Title
              const Text(
                'Laut Bercerita',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Pallete.textColor), // Menggunakan Pallete
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              
              // Loan Status Bar
              const LoanStatusBar(),
              const SizedBox(height: 24),
              
              // Tab Bar for Details, Komentar, Review
              TabBar(
                controller: _tabController,
                labelColor: Pallete.primaryColor, // Menggunakan Pallete
                unselectedLabelColor: Pallete.textGrayColor, // Menggunakan Pallete
                indicatorColor: Pallete.primaryColor, // Menggunakan Pallete
                tabs: const [
                  Tab(text: 'Details'),
                  Tab(text: 'Komentar'),
                  Tab(text: 'Review'),
                ],
              ),
              const SizedBox(height: 16),

              // Tab Bar View
              SizedBox(
                height: 350, // Beri tinggi agar TabBarView bisa di-render
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    // Details Tab
                    const BookInfoSection(),
                    
                    // Comments Tab - Placeholder
                    Center(child: Text('Komentar akan ditampilkan di sini.', style: TextStyle(color: Pallete.textGrayColor))), // Menggunakan Pallete
                    
                    // Reviews Tab - Placeholder
                    Center(child: Text('Review akan ditampilkan di sini.', style: TextStyle(color: Pallete.textGrayColor))), // Menggunakan Pallete
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // Bottom Action Buttons
      bottomNavigationBar: const ActionButtonsBar(),
    );
  }
}
