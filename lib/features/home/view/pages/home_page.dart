import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart';
import 'package:litera_app/features/home/view/widgets/book_grid.dart';
import 'package:litera_app/features/home/view/widgets/greeting_header.dart';
import 'package:litera_app/features/home/view/widgets/home_app_bar.dart';

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
      appBar: AppBar(),
      backgroundColor: Pallete.primaryLightColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeAppBar(),
          GreetingHeader(),
          Expanded(
            child: BookGrid(),
          ),
        ],
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
              size: 100,
            ),
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