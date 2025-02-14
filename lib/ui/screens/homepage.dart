import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

// Import your other screen files
import 'wishlist.dart';
import 'purchase.dart';
import 'profile.dart';
import 'HomeContent.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
     HomeContent(),
     WishlistScreen(),
     PurchaseScreen(),
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
        backgroundColor: Colors.white, // Change this to match the background
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
          Icon(Icons.favorite_outline, color: Colors.white),
          Icon(Icons.chat_bubble_outline, color: Colors.white),
          Icon(Icons.person_outline, color: Colors.white),
        ],
      ),

      extendBody: true,
    );
  }
}

