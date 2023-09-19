import 'package:flutter/material.dart';
import 'package:restaurant_submission/common/routes/app_routes.dart';
import 'package:restaurant_submission/common/utils/app_color/app_color.dart';
import 'package:restaurant_submission/common/utils/app_text/app_text.dart';
import 'package:restaurant_submission/view/ui/login/login_page.dart';
import 'package:restaurant_submission/view/widgets/button_widget.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: AppColor.whiteColor,
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ayoo Makan',
                style: AppText.text32.copyWith(
                  color: AppColor.primaryColor,
                  fontWeight: AppText.fontWeight['800'],
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Silahkan pesan makan dan minum dari mana saja',
                style: AppText.text20,
              ),
              const SizedBox(height: 140),
              ButtonWidget(
                onTap: () {
                  AppRoutes.push(context, const LoginPage());
                },
                titleColor: AppColor.whiteColor,
                title: 'Mulai',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
