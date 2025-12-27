import 'package:DialBook/UI/contacts_list/contacts_list_page.dart';
import 'package:DialBook/UI/contacts_list/favorite_page.dart';
import 'package:DialBook/UI/contacts_list/keypad_page.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const ContactsListPage(),
    const FavoritesPage(),
    const KeypadPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],

      // ✅ Curved Bottom Navigation Bar
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex,
        height: 60,
        color: Colors.blue,
        backgroundColor: Colors.white,
        buttonBackgroundColor: Colors.blueAccent,
        animationDuration: const Duration(milliseconds: 300),
        items: const [
          Icon(Icons.contacts, size: 30, color: Colors.white),
          Icon(Icons.star, size: 30, color: Colors.white),
          Icon(Icons.dialpad, size: 30, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
