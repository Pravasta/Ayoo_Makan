import 'package:flutter/material.dart';
import 'package:restaurant_submission/common/routes/app_routes.dart';
import 'package:restaurant_submission/common/utils/app_color/app_color.dart';
import 'package:restaurant_submission/common/utils/app_text/app_text.dart';

class LoadingDialog {
  static loadingDialog(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 1),
      () {
        AppRoutes.pop(context);
      },
    );
    return Dialog(
      alignment: Alignment.center,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        height: 150,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(
                color: AppColor.primaryColor,
              ),
              const SizedBox(height: 10),
              Text(
                'Loading',
                style: AppText.text18.copyWith(
                  color: AppColor.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
