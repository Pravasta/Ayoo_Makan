import 'package:flutter/material.dart';
import 'package:restaurant_submission/common/utils/app_color/app_color.dart';
import 'package:restaurant_submission/common/utils/app_text/app_text.dart';

class TableWidget extends StatelessWidget {
  const TableWidget({
    super.key,
    required this.imageAssets,
    required this.name,
    required this.chair,
    required this.table,
  });

  final String imageAssets;
  final String name;
  final int chair;
  final int table;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(imageAssets),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: AppText.text24.copyWith(
              color: AppColor.whiteColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '$table Table $chair Chair',
            style: AppText.text16.copyWith(
              color: AppColor.whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
