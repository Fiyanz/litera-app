import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart';
import 'package:litera_app/features/home/view/widgets/book_grid.dart';
import 'package:litera_app/features/home/view/widgets/greeting_header.dart';
import 'package:litera_app/features/home/view/widgets/home_app_bar.dart';
import 'package:litera_app/features/home/view/widgets/wave_clipper.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.primaryLightColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Pallete.primaryColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 12.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Pallete.primaryLightColor,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Cari buku, penulis...',
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Icons.search_off),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(14),
                  )
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hallo!',
                    style: TextStyle(
                      color: Pallete.primaryLightColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Yuk, cari buku favaritemu di sini.',
                    style: TextStyle(
                      color: Pallete.primaryLightColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
            ),
                ],
              ),
            ),
            Expanded(
              child: ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  color: Pallete.primaryLightColor,
                  child: const BookGrid(),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bookmark_border_outlined,
            ),
            label: 'Bookmarks'
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle,
              size: 50,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
              icon: Icon(
              Icons.chat_bubble_outline,
            ),
            label: 'Chat'
          ),
          BottomNavigationBarItem(
              icon: Icon(
              Icons.person_outline,
            ),
            label: 'Profile'
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Pallete.backgroundColor,
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