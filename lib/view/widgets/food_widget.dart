import 'package:flutter/material.dart';
import 'package:restaurant_submission/common/utils/app_color/app_color.dart';
import 'package:restaurant_submission/common/utils/app_text/app_text.dart';

class FoodWidget extends StatelessWidget {
  const FoodWidget({
    super.key,
    required this.name,
    required this.price,
    required this.rating,
    required this.imageAssets,
  });

  final String name;
  final int price;
  final double rating;
  final String imageAssets;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 1 / 2,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: AppColor.greyColor),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    imageAssets,
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppText.text18,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.orange,
                    ),
                    Text(
                      rating.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppText.text14
                          .copyWith(fontWeight: AppText.fontWeight['500']),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Rp. $price',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: AppText.text16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
