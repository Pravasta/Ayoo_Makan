import 'package:flutter/material.dart';
import 'package:restaurant_submission/common/utils/app_color/app_color.dart';
import 'package:restaurant_submission/common/utils/app_text/app_text.dart';

class ProfileListWidget extends StatelessWidget {
  const ProfileListWidget({
    super.key,
    required this.imageAssets,
    required this.title,
  });

  final String imageAssets;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              imageAssets,
              width: 26,
            ),
            const SizedBox(width: 18),
            Expanded(
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppText.text18.copyWith(
                  fontWeight: AppText.fontWeight['500'],
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: AppColor.greyColor,
            ),
          ],
        ),
        const SizedBox(height: 8),
        const Divider(
          color: AppColor.greyColor,
          indent: 45,
          thickness: 0.1,
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
