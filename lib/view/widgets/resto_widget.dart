import 'package:flutter/material.dart';
import 'package:restaurant_submission/common/utils/app_color/app_color.dart';
import 'package:restaurant_submission/common/utils/app_text/app_text.dart';

class RestoWidget extends StatelessWidget {
  const RestoWidget({
    super.key,
    required this.name,
    required this.location,
    required this.price,
    required this.rating,
    required this.imageAssets,
    this.width,
  });

  final String name;
  final String location;
  final int price;
  final double rating;
  final String imageAssets;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      child: Stack(
        children: [
          Container(
            width: width ?? MediaQuery.of(context).size.width * 3 / 6,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: AppColor.greyColor),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    child: Image.asset(
                      imageAssets,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppText.text16,
                      ),
                      Text(
                        location,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppText.text12
                            .copyWith(fontWeight: AppText.fontWeight['500']),
                      ),
                      Text(
                        'Rp. $price',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: AppText.text14,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(10),
                ),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.orange,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    rating.toString(),
                    style: AppText.text14.copyWith(
                        color: AppColor.whiteColor,
                        fontWeight: AppText.fontWeight['400']),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
