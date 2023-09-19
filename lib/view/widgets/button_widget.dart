import 'package:flutter/material.dart';
import 'package:restaurant_submission/common/utils/app_color/app_color.dart';
import 'package:restaurant_submission/common/utils/app_text/app_text.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    this.height,
    required this.titleColor,
    required this.title,
    this.backgroundColor,
    this.borderColor,
    required this.onTap,
  });

  final double? height;
  final Color titleColor;
  final String title;
  final Color? backgroundColor;
  final Color? borderColor;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: backgroundColor ?? AppColor.primaryColor,
          border: Border.all(
            color: borderColor ?? AppColor.primaryColor,
            width: 1,
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: AppText.text18.copyWith(
              color: titleColor,
            ),
          ),
        ),
      ),
    );
  }
}
