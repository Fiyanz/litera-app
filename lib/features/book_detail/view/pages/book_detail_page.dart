import 'package:flutter/material.dart';
import 'package:litera_app/core/models/book_model.dart';
import 'package:litera_app/core/theme/app_pallete.dart';
import 'package:litera_app/features/book_detail/view/widgets/book_image_slider.dart';
import '../widgets/action_buttons_bar.dart';
import '../widgets/book_info_section.dart';
import '../widgets/comment_tab_view.dart';
import '../widgets/loan_status_bar.dart';
import '../widgets/review_tab_view.dart';

class BookDetailPage extends StatefulWidget {
  // PERBAIKAN 1: Deklarasikan bahwa halaman ini akan menerima sebuah 'Book'
  final Book book; 

  // PERBAIKAN 2: Perbarui constructor untuk mewajibkan parameter 'book'
  const BookDetailPage({super.key, required this.book});

  @override
  State<BookDetailPage> createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _showActionButtons = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    if (_tabController.index == 0) {
      if (!_showActionButtons) setState(() { _showActionButtons = true; });
    } else {
      if (_showActionButtons) setState(() { _showActionButtons = false; });
    }
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabSelection);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              // PERBAIKAN 3: Gunakan data dari 'widget.book' untuk judul
              title: Text(widget.book.title), 
              pinned: true,
              floating: true,
              elevation: 0,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            ),
            SliverToBoxAdapter(
              child: _buildTopContent(),
            ),
            SliverPersistentHeader(
              delegate: _SliverAppBarDelegate(
                TabBar(
                  controller: _tabController,
                  labelColor: Pallete.primaryColor,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Pallete.primaryColor,
                  tabs: const [
                    Tab(text: 'Details'),
                    Tab(text: 'Komentar'),
                    Tab(text: 'Review'),
                  ],
                ),
              ),
              pinned: true,
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: const [
            SingleChildScrollView(padding: EdgeInsets.all(16.0), child: BookInfoSection()),
            CommentTabView(),
            ReviewTabView(),
          ],
        ),
      ),
      bottomNavigationBar: _showActionButtons
    ? ActionButtonsBar(book: widget.book) // <-- Kirim data buku ke ActionButtonsBar
    : null,
    );
  }

  Widget _buildTopContent() {
    return Column(
      children: [
        const SizedBox(height: 16),
        // PERBAIKAN 4: Kirim daftar URL gambar ke widget slider
        BookImageSlider(imageUrls: widget.book.imageUrls),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            widget.book.title, // Judul dinamis
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 24),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: LoanStatusBar(),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}

// Kelas helper tidak berubah...
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);
  final TabBar _tabBar;
  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: _tabBar,
    );
  }
  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

