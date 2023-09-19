import 'package:flutter/material.dart';
import 'package:restaurant_submission/view/ui/splash/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Restaurant Submission',
      debugShowCheckedModeBanner: false,
      home: SplashScreenPage(),
    );
  }
}
