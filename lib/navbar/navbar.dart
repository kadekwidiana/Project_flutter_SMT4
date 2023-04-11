import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../about/about_page.dart';
import '../beranda/home_page.dart';
import '../favorit/favorit_page.dart';
import '../tersimpan/stored_page.dart';

class MyNavbar extends StatefulWidget {
  const MyNavbar({super.key});

  @override
  State<MyNavbar> createState() => _MyNavbarState();
}

class _MyNavbarState extends State<MyNavbar> {
  int _selectedIndex = 0;

  List<Widget> _pages = [HomePage(), FavoritPage(), StoredPage(), AboutPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        color: Colors.brown,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: GNav(
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            backgroundColor: Colors.brown,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.brown.shade800,
            gap: 8,
            padding: EdgeInsets.all(16),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.favorite_border,
                text: 'Favorit',
              ),
              GButton(
                icon: Icons.save,
                text: 'Tersimpan',
              ),
              GButton(
                icon: Icons.web_asset,
                text: 'About',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
