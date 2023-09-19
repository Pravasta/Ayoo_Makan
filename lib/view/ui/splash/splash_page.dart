import 'dart:async';
import 'package:flutter/material.dart';
import 'package:restaurant_submission/common/utils/app_color/app_color.dart';
import 'package:restaurant_submission/common/utils/app_text/app_text.dart';
import 'package:restaurant_submission/controller/auth_controller.dart';
import 'package:restaurant_submission/view/ui/introduction/introduction_page.dart';
import 'package:restaurant_submission/view/ui/main/main_page.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    _isLogin();
  }

  _isLogin() async {
    final navigator = Navigator.of(context);

    final nameValue = await AuthController().getKey('name');

    await Future.delayed(const Duration(seconds: 2));

    if (nameValue != null) {
      navigator.pushAndRemoveUntil(MaterialPageRoute(
        builder: (context) {
          return const MainPage();
        },
      ), (route) => false);
    } else {
      navigator.pushAndRemoveUntil(MaterialPageRoute(
        builder: (context) {
          return const IntroductionPage();
        },
      ), (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColor.primaryColor,
        child: Stack(
          children: [
            Positioned(
              left: -20,
              top: -20,
              child: Image.asset(
                'assets/image/splash_1.png',
              ),
            ),
            Center(
              child: Text(
                'Ayoo Makan',
                style: AppText.text32.copyWith(
                  color: AppColor.whiteColor,
                  fontWeight: AppText.fontWeight['700'],
                ),
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 1 / 5,
              right: 0,
              child: Image.asset(
                'assets/image/splash_2.png',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
