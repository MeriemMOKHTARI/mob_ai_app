
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:mobaiflutter/ui/screens/gender_screen.dart';


class SplashScreen extends StatefulWidget {
  // final Account account;
  // final Databases databases;
  // final Functions functions;

  const SplashScreen({
    Key? key,
    // required this.account,
    // required this.databases,
    // required this.functions,
  }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // final storage = FlutterSecureStorage();

  // Future<bool> checkUserSession() async {print('hhhhhhhhhhhhhhhhhhhh');

  //   final sessionID = await storage.read(key: 'new_user_id');
  //   if (sessionID!=null) {
  //     return true;
  //   } else {
  //     print('No session found, navigate to login screen.');
  //     return false;
  //   }
  // }

  // Future<void> setAppLanguage() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final savedLocale = prefs.getString('locale');

  //   final systemLocale = flutter_widgets.WidgetsBinding.instance.window.locale;
  //   final languageCode = systemLocale.languageCode;

  //   if (savedLocale == null || savedLocale.isEmpty) {
  //     if (['en', 'fr', 'ar', 'es'].contains(languageCode)) {
  //       await context.setLocale(flutter_widgets.Locale(languageCode));
  //       await prefs.setString('locale', languageCode);
  //     } else {
  //       await context.setLocale(flutter_widgets.Locale('en'));
  //       await prefs.setString('locale', 'en');
  //     }
  //   } else {
  //     await context.setLocale(flutter_widgets.Locale(savedLocale));
  //   }
  // }

  @override
  void initState() {
    super.initState();
    initializeApp();
  }

  void initializeApp() async {
    // await setAppLanguage();
    await Future.delayed(Duration(seconds: 2)); // Add a delay for splash screen visibility
    navigateBasedOnSession();
  }

  void navigateBasedOnSession() async {
    // final isLoggedIn = await checkUserSession();

    // if (isLoggedIn) {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => HomePage(),
    //     ),
    //   );
    // } else {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => GenderScreen(),
          //  AuthenticationScreen(
          //   account: widget.account,
          //   databases: widget.databases,
          //   functions: widget.functions,
          // ),
        ),
      );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00A392),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Config.buildLogo(),
            const SizedBox(height: 20),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

