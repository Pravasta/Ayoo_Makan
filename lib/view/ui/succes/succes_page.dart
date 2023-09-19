import 'package:flutter/material.dart';
import 'package:restaurant_submission/common/routes/app_routes.dart';
import 'package:restaurant_submission/common/utils/app_color/app_color.dart';
import 'package:restaurant_submission/common/utils/app_text/app_text.dart';
import 'package:restaurant_submission/view/ui/main/main_page.dart';
import 'package:restaurant_submission/view/widgets/button_widget.dart';

class SuccesPage extends StatelessWidget {
  const SuccesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/image/success-icon.png',
                width: 160,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 24),
              Text(
                'Pesannan mu telah Berhasil',
                style: AppText.text24,
              ),
              const SizedBox(height: 50),
              ButtonWidget(
                titleColor: AppColor.whiteColor,
                title: 'Kembali Ke Home',
                onTap: () {
                  AppRoutes.pushRemove(
                    context,
                    const MainPage(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
