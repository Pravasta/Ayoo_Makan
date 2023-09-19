import 'package:flutter/material.dart';
import 'package:restaurant_submission/common/routes/app_routes.dart';
import 'package:restaurant_submission/common/utils/app_color/app_color.dart';
import 'package:restaurant_submission/common/utils/app_text/app_text.dart';
import 'package:restaurant_submission/view/widgets/button_widget.dart';

class AlertDialogUtils {
  final String? title;
  final String? imageAssets;

  AlertDialogUtils({
    this.title,
    this.imageAssets,
  });

  dialogShow(BuildContext context) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          contentPadding: const EdgeInsets.all(20),
          alignment: Alignment.center,
          content: SizedBox(
            height: 250,
            width: double.infinity,
            child: Column(
              children: [
                imageAssets != null
                    ? Image.asset(
                        imageAssets!,
                        width: 90,
                      )
                    : const SizedBox(),
                const SizedBox(height: 8),
                Expanded(
                  child: Text(
                    title ?? 'Loading',
                    style: AppText.text16,
                  ),
                ),
                const SizedBox(height: 8),
                ButtonWidget(
                  titleColor: AppColor.whiteColor,
                  title: 'Okayyy',
                  onTap: () {
                    AppRoutes.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
