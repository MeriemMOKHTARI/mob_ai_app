import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mobaiflutter/ui/screens/homepage.dart';
import 'package:mobaiflutter/ui/screens/sign_in_screen.dart';
import 'package:mobaiflutter/ui/screens/splashscreen.dart'; // Remplace par le bon chemin de ton fichier

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mobai App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:HomePage(),
      //  SplashScreen(),
    );
  }
}

