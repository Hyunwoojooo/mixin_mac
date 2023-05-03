import 'package:flutter/material.dart';
import 'package:mixin_mac/screens/onboarding_screens/onboarding_screen_main.dart';
// import 'firebase_options.dart';

Future<void> main() async{
  runApp(Mixin());
}

class Mixin extends StatelessWidget {
  Mixin({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'SUIT',
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
      ),
      home: const OnboardingScreen(),

    );
  }
}


