import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';


// Import your other screen files
import 'my_books.dart';
import 'CartScreen.dart';
import 'profile.dart';
import 'HomeContent.dart';
import 'bot.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
     HomeContent(),
     MyBooksScreen(),
     PurchaseBotScreen(),
     CartScreen(),
     Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      body: Stack(
        children: [
          _screens[_currentIndex],
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 70, // Adjust this value as needed
              color: Colors.white,
            ),
          ),
        ],
      ),
     bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent, // Change this to match the background
        color: const Color(0xFF00A392),
        buttonBackgroundColor: const Color(0xFF00A392),
        height: 60,
        index: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          Icon(Icons.home_outlined, color: Colors.white),
          Icon(Icons.menu_book_outlined, color: Colors.white),
          Icon(Icons.smart_toy_outlined,color: Colors.white),
          Icon(Icons.shopping_cart_outlined, color: Colors.white),
          Icon(Icons.person_outline, color: Colors.white),
        ],
      ),

      extendBody: true,
    );
  }
}

