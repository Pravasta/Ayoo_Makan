import 'package:flutter/material.dart';
import 'package:restaurant_submission/common/utils/app_color/app_color.dart';
import 'package:restaurant_submission/common/utils/app_text/app_text.dart';

class ServiceWidget extends StatelessWidget {
  const ServiceWidget({
    super.key,
    required this.imageAssets,
    required this.title,
    required this.onTap,
  });

  final String imageAssets;
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              border: Border.all(
                width: 0.5,
                color: AppColor.blackColor,
              ),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Image.asset(
                imageAssets,
                width: 30,
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(title, style: AppText.text16),
      ],
    );
  }
}
