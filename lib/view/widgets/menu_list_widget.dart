import 'package:flutter/material.dart';
import 'package:restaurant_submission/common/utils/app_color/app_color.dart';
import 'package:restaurant_submission/common/utils/app_text/app_text.dart';

class MenuListWidget extends StatefulWidget {
  const MenuListWidget({
    super.key,
    required this.imageAssets,
    required this.name,
    required this.price,
    required this.totalBuy,
    required this.isLike,
  });

  final String imageAssets;
  final String name;
  final int price;
  final int totalBuy;
  final int isLike;

  @override
  State<MenuListWidget> createState() => _MenuListWidgetState();
}

class _MenuListWidgetState extends State<MenuListWidget> {
  int _counter = 0;

  void add() {
    _counter++;
    setState(() {});
  }

  void remove() {
    _counter--;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    widget.imageAssets,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppText.text18,
                      ),
                      Text(
                        '${widget.totalBuy} terjual  Disukai oleh ${widget.isLike}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppText.text14.copyWith(
                          color: AppColor.greyColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rp ${widget.price}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppText.text18.copyWith(
                          color: AppColor.primaryColor,
                        ),
                      ),
                      _counter == 0
                          ? GestureDetector(
                              onTap: add,
                              child: Container(
                                padding: const EdgeInsets.all(1),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  shape: BoxShape.rectangle,
                                  color: AppColor.primaryColor,
                                ),
                                child: const Icon(
                                  Icons.add,
                                  color: AppColor.whiteColor,
                                ),
                              ),
                            )
                          : SizedBox(
                              width: 100,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: remove,
                                    child: Container(
                                      padding: const EdgeInsets.all(1),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        shape: BoxShape.rectangle,
                                        color: AppColor.greyColor,
                                      ),
                                      child: const Icon(
                                        Icons.remove,
                                        color: AppColor.whiteColor,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '$_counter',
                                    style: AppText.text20.copyWith(
                                      color: AppColor.primaryColor,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: add,
                                    child: Container(
                                      padding: const EdgeInsets.all(1),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        shape: BoxShape.rectangle,
                                        color: AppColor.primaryColor,
                                      ),
                                      child: const Icon(
                                        Icons.add,
                                        color: AppColor.whiteColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        const Divider(
          color: AppColor.greyColor,
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
