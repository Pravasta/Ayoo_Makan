import 'package:flutter/material.dart';
import 'package:restaurant_submission/common/utils/app_color/app_color.dart';
import 'package:restaurant_submission/common/utils/app_text/app_text.dart';

class DiscountWIdget extends StatelessWidget {
  const DiscountWIdget({
    super.key,
    required this.discount,
  });

  final int discount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 23,
        horizontal: 15,
      ),
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: discount < 50 ? Colors.orange : AppColor.primaryColor,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Text(
            'Diskon $discount%',
            style: AppText.text14,
          ),
          const SizedBox(width: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                width: 2,
                color: discount < 50 ? Colors.orange : AppColor.primaryColor,
              ),
              color:
                  discount < 50 ? Colors.orangeAccent : AppColor.primaryColor,
            ),
            child: Text(
              'Klaim',
              style: AppText.text14.copyWith(
                color: AppColor.whiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
