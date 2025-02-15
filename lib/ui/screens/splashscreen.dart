import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'package:mobaiflutter/ui/screens/gender_screen.dart';
import 'package:mobaiflutter/ui/screens/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    initializeApp();
  }

  void initializeApp() async {
    await Future.delayed(Duration(seconds: 2));
    navigateBasedOnSession();
  }

  void navigateBasedOnSession() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => WelcomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F3D3E),
        // 0xFF00A392),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logoSplash.png', height: 300, width: 300),
            // Text(
            //   'Bookini',
            //   style: GoogleFonts.poppins(
            //     color: Colors.white,
            //     fontWeight: FontWeight.bold,
            //     fontSize: 31,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}