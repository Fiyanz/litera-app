import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart';
import 'package:litera_app/features/book_detail/model/book_info.dart';
import 'package:litera_app/features/book_detail/view/widgets/action_buttons_bar.dart';
import 'package:litera_app/features/book_detail/view/widgets/book_image_slider.dart';
import 'package:litera_app/features/book_detail/view/widgets/book_info_section.dart';
import 'package:litera_app/features/book_detail/view/widgets/comment_tab_view.dart';

class BookDetailPage extends StatefulWidget {
  // Constructor ini sudah benar, halaman ini siap menerima data dari luar.
  final String bookId;
  final String ownerId;
  final int pricePerDay;
  final List<String> imageUrls;
  final BookInfo bookInfo;

  const BookDetailPage({
    super.key,
    required this.bookId,
    required this.ownerId,
    required this.pricePerDay,
    required this.imageUrls,
    required this.bookInfo,
  });

  @override
  State<BookDetailPage> createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _showActionButtons = true; 

  void _handleTabSelection() {
  // Jika tab yang dipilih adalah tab pertama (index 0, yaitu "Details")
  if (_tabController.index == 0) {
    // Jika tombol sedang tidak tampil, maka tampilkan
    if (!_showActionButtons) {
      setState(() {
        _showActionButtons = true;
      });
    }
  } else { // Jika tab lain yang dipilih
    // Jika tombol sedang tampil, maka sembunyikan
    if (_showActionButtons) {
      setState(() {
        _showActionButtons = false;
      });
    }
  }
}

  @override
  void initState() {
    super.initState();
    // Controller diatur untuk 2 tab
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      // Panggil fungsi untuk menangani perubahan tab
      _handleTabSelection();
    });
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
              // PERBAIKAN: Menggunakan data dari widget -> widget.bookInfo.title
              title: Text(widget.bookInfo.title),
              pinned: true,
              floating: true,
              backgroundColor: Pallete.primaryLightColor,
              expandedHeight: 350.0,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: const EdgeInsets.only(top: 90.0),
                  // PERBAIKAN: Menggunakan data dari widget -> widget.imageUrls
                  child: BookImageSlider(imageUrls: widget.imageUrls),
                ),
              ),
            ),
            SliverPersistentHeader(
              delegate: _SliverAppBarDelegate(
                TabBar(
                  controller: _tabController,
                  labelColor: Pallete.primaryColor,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Pallete.primaryColor,
                  // PERBAIKAN: Dirapikan menjadi 2 tab yang sesuai
                  tabs: const [
                    Tab(text: 'Details'),
                    Tab(text: 'Komentar'),
                  ],
                ),
              ),
              pinned: true,
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          // PERBAIKAN: Hanya ada 2 halaman/view untuk 2 tab
          children: [
            // Tab 1: Details
            SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              // PERBAIKAN: Menggunakan data dari widget -> widget.bookInfo
              child: BookInfoSection(bookInfo: widget.bookInfo),
            ),
            // Tab 2: Komentar
            const CommentTabView(),
          ],
        ),
      ),
      bottomNavigationBar: _showActionButtons
      ? ActionButtonsBar(
          bookId: widget.bookId,
          bookTitle: widget.bookInfo.title,
          bookOwnerId: widget.ownerId,
          bookImageUrl: widget.imageUrls.isNotEmpty ? widget.imageUrls[0] : '',
          pricePerDay: widget.pricePerDay,
        )
      : null,
    );
  }
}

// Class helper untuk TabBar menempel, tidak ada perubahan
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
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) => false;
}