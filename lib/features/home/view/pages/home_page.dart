import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart';
import 'package:litera_app/features/home/viewmodel/home_viewmodel.dart';
import 'package:litera_app/features/home/view/widgets/filter_dialog.dart';
import 'package:litera_app/features/home/view/widgets/horizontal_book_list.dart';
import 'package:litera_app/features/home/view/widgets/wave_clipper.dart';
import 'package:provider/provider.dart'; 

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  /// Ia menerima [viewModel] untuk memisahkan logika dari UI.
  void _showFilterDialog(BuildContext context, HomeViewModel viewModel) async {
    // 1. Minta ViewModel untuk memulai pengambilan data.
    // Tampilan akan secara otomatis diperbarui oleh Consumer untuk menunjukkan loading.
    await viewModel.fetchFilterOptions();

    // Cek jika widget masih ada di tree sebelum menampilkan dialog
    if (!context.mounted) return;

    // 2. Ambil data yang sudah siap dari ViewModel.
    final filterData = viewModel.filterData;

    // 3. Tampilkan dialog dengan data yang sudah didapat.
    final result = await showDialog<Map<String, String>>(
      context: context,
      builder: (BuildContext dialogContext) {
        // Kirim data ke widget dialog yang "bodoh"
        return FilterDialog(
          years: filterData['years'] ?? [],
          locations: filterData['locations'] ?? [],
          categories: filterData['categories'] ?? [],
        );
      },
    );

    // 4. Proses hasil dari dialog jika ada.
    if (result != null) {
      print('Hasil filter yang akan dicari: $result');
      // TODO: Panggil method di ViewModel untuk melakukan pencarian
      // contoh: viewModel.searchBooks(query: _searchController.text, filters: result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.primaryLightColor, // Latar belakang utama putih
      body: CustomScrollView(
        slivers: [
          // SliverAppBar yang konsisten dengan desain
          SliverAppBar(
            backgroundColor: Colors.transparent, // Buat transparan agar child bisa terlihat
            expandedHeight: 220.0, // Sesuaikan tinggi agar semua elemen muat
            floating: true,
            pinned: false,
            snap: true,
            elevation: 0,
            // FlexibleSpaceBar adalah tempat kita membangun header kustom
            flexibleSpace: FlexibleSpaceBar(
              background: ClipPath( // 1. KEMBALIKAN BENTUK GELOMBANG DENGAN CLIPPATH
                clipper: WaveClipper(),
                child: Container(
                  color: Pallete.primaryColor, // Warna biru header
                  child: Padding(
                    padding: const EdgeInsets.only(top: 45.0), // Padding untuk status bar
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Baris untuk Search Bar dan Ikon-ikon
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16.0, 10.0, 8.0, 12.0),
                          child: Row(
                            children: [
                              // Search Bar
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Pallete.primaryLightColor,
                                    borderRadius: BorderRadius.circular(30.0), // Bentuk rounded
                                  ),
                                  child: const TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Cari buku, penulis...',
                                      prefixIcon: Icon(Icons.search),
                                      suffixIcon: Icon(Icons.camera_alt_outlined), // Ikon kamera kembali
                                      isDense: true,
                                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0),

                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                              
                              Consumer<HomeViewModel>(
                                builder: (context, viewModel, child) {
                                  return IconButton(
                                    // Tampilkan ikon loading jika viewModel sedang mengambil data
                                    icon: viewModel.isLoading
                                        ? const SizedBox(
                                            width: 24,
                                            height: 24,
                                            child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2.5),
                                          )
                                        : const Icon(Icons.filter_list, color: Pallete.primaryLightColor, size: 28),
                                    // Nonaktifkan tombol saat loading untuk mencegah klik ganda
                                    onPressed: viewModel.isLoading
                                        ? null
                                        : () => _showFilterDialog(context, viewModel),
                                  );
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.notifications_none, color: Pallete.primaryLightColor, size: 28),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                        // Teks Sambutan
                        const Padding(
                          padding: EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Halo!',
                                  style: TextStyle(
                                      color: Pallete.primaryLightColor,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(height: 4),
                              Text('Yuk, cari buku favoritmu di sini.',
                                  style: TextStyle(
                                      color: Pallete.primaryLightColor, fontSize: 16)),
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
              // Jika sedang loading, tampilkan indikator di body
              if (viewModel.isLoading && viewModel.popularBooks.isEmpty) {
                return const SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Pallete.primaryColor,
                    ),
                  ),
                );
              }
              // Jika tidak ada buku, tampilkan pesan
              if (viewModel.popularBooks.isEmpty && viewModel.newReleaseBooks.isEmpty) {
                return const SliverFillRemaining(
                  child: Center(
                    child: Text('Gagal memuat buku atau tidak ada buku tersedia.'),
                  ),
                );
              }
              // Jika data ada, tampilkan listnya
              return SliverList(
                delegate: SliverChildListDelegate(
                  [
                    HorizontalBookList(
                      sectionTitle: "Buku yang sering dipinjam",
                      books: viewModel.popularBooks, // Ambil data dari ViewModel
                    ),
                    HorizontalBookList(
                      sectionTitle: "Rekomendasi Untukmu",
                      books: viewModel.recommendedBooks, // Ambil data dari ViewModel
                    ),
                    HorizontalBookList(
                      sectionTitle: "Rilisan Terbaru",
                      books: viewModel.newReleaseBooks, // Ambil data dari ViewModel
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        // ... (Tidak ada perubahan di sini)
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark_border_outlined), label: 'Bookmarks'),
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