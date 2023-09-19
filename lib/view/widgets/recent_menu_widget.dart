import 'package:restaurant_submission/common/utils/app_color/app_color.dart';
import 'package:restaurant_submission/common/utils/app_text/app_text.dart';
import 'package:flutter/material.dart';

class RecentMenuWidget extends StatelessWidget {
  const RecentMenuWidget({
    super.key,
    required this.title,
    required this.status,
    required this.isCancel,
  });

  final String title;
  final String status;
  final bool isCancel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/image/menu_small.png',
            width: 90,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppText.text20,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '${DateTime.now()}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppText.text14.copyWith(color: AppColor.greyColor),
                ),
              ],
            ),
          ),
          Text(
            status,
            style: AppText.text14.copyWith(
              color: isCancel ? Colors.red : AppColor.primaryColor,
              fontWeight: AppText.fontWeight['500'],
            ),
          ),
        ],
      ),
    );
  }
}
