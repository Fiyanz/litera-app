import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart';
import 'package:litera_app/features/add_book/view/pages/add_book_page.dart';
import 'package:litera_app/features/bookmark/view/pages/bookmark_page.dart'; // Import halaman Bookmark
import 'package:litera_app/features/chat/view/pages/chat_list_page.dart';
import 'package:litera_app/features/home/viewmodel/home_viewmodel.dart';
import 'package:litera_app/features/home/view/widgets/filter_dialog.dart';
import 'package:litera_app/features/home/view/widgets/horizontal_book_list.dart';
import 'package:litera_app/features/home/view/widgets/wave_clipper.dart';
import 'package:litera_app/features/notification/views/pages/notifitations_page.dart';
import 'package:litera_app/features/profile/view/pages/profile_page.dart';
import 'package:provider/provider.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // Daftar halaman yang akan ditampilkan di IndexedStack.
  static const List<Widget> _pages = <Widget>[
    _HomePageContent(),   // Halaman Home (index 0)
    BookmarkPage(),       // Halaman Bookmark (index 1)
    AddBookPage(),
    ChatListPage(),   // Placeholder untuk index 3
    ProfilePage(), // Placeholder untuk index 4
  ];

  // Fungsi ini akan dipanggil setiap kali item di navigasi bawah ditekan.
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),

      // BottomNavigationBar tidak perlu diubah, karena logikanya sudah benar.
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border_outlined),
            activeIcon: Icon(Icons.bookmark), // Ikon ini akan tampil saat aktif
            label: 'Bookmark',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle, size: 50), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Pallete.primaryColor,
        unselectedItemColor: Pallete.textGrayColor,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        elevation: 10,
        backgroundColor: Pallete.primaryLightColor,
      ),
    );
  }
}


class _HomePageContent extends StatelessWidget {
  const _HomePageContent();

  // Method untuk filter dialog kita pindahkan ke sini
  void _showFilterDialog(BuildContext context, HomeViewModel viewModel) async {
    final filterData = await viewModel.fetchFilterOptions();
    if (!context.mounted) return;
    final result = await showDialog<Map<String, String>>(
      context: context,
      builder: (BuildContext dialogContext) {
        return FilterDialog(
          years: filterData['years'] ?? [],
          locations: filterData['locations'] ?? [],
          categories: filterData['categories'] ?? [],
        );
      },
    );
    if (result != null) {
      print('Hasil filter yang akan dicari: $result');
      // TODO: Panggil method di ViewModel untuk melakukan pencarian
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.primaryLightColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            expandedHeight: 220.0,
            floating: true,
            pinned: false,
            snap: true,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              background: ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  color: Pallete.primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 45.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16.0, 10.0, 8.0, 12.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Pallete.primaryLightColor,
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  child: const TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Cari buku, penulis...',
                                      prefixIcon: Icon(Icons.search),
                                      // suffixIcon: Icon(Icons.camera_alt_outlined),
                                      isDense: true,
                                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0),
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                              Consumer<HomeViewModel>(
                                builder: (context, viewModel, child) {
                                  return IconButton(
                                    icon: viewModel.isLoading
                                        ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2.5))
                                        : const Icon(Icons.filter_list, color: Pallete.primaryLightColor, size: 28),
                                    onPressed: viewModel.isLoading ? null : () => _showFilterDialog(context, viewModel),
                                  );
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.notifications_none, color: Pallete.primaryLightColor, size: 28),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const NotificationPage(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Halo!', style: TextStyle(color: Pallete.primaryLightColor, fontSize: 24, fontWeight: FontWeight.bold)),
                              SizedBox(height: 4),
                              Text('Yuk, cari buku favoritmu di sini.', style: TextStyle(color: Pallete.primaryLightColor, fontSize: 16)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Consumer<HomeViewModel>(
            builder: (context, viewModel, child) {
              if (viewModel.isLoading && viewModel.popularBooks.isEmpty) {
                return const SliverFillRemaining(child: Center(child: CircularProgressIndicator(color: Pallete.primaryColor)));
              }
              if (viewModel.popularBooks.isEmpty && viewModel.newReleaseBooks.isEmpty) {
                return const SliverFillRemaining(child: Center(child: Text('Gagal memuat buku atau tidak ada buku tersedia.')));
              }
              return SliverList(
                delegate: SliverChildListDelegate(
                  [
                    HorizontalBookList(sectionTitle: "Buku yang sering dipinjam", books: viewModel.popularBooks),
                    HorizontalBookList(sectionTitle: "Rekomendasi Untukmu", books: viewModel.recommendedBooks),
                    HorizontalBookList(sectionTitle: "Rilisan Terbaru", books: viewModel.newReleaseBooks),
                    const SizedBox(height: 20),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}