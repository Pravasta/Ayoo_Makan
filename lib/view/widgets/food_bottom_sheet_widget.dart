import 'package:flutter/material.dart';
import 'package:restaurant_submission/common/utils/alert_dialog/alert_dialog.dart';
import 'package:restaurant_submission/common/utils/app_color/app_color.dart';
import 'package:restaurant_submission/common/utils/app_text/app_text.dart';
import 'package:restaurant_submission/view/ui/cart/cart_page.dart';
import 'package:restaurant_submission/view/widgets/button_widget.dart';

class FoodBottomSheetWidget extends StatefulWidget {
  const FoodBottomSheetWidget({
    super.key,
    required this.imageAssets,
    required this.name,
    required this.price,
    required this.rating,
  });

  final String imageAssets;
  final String name;
  final int price;
  final double rating;

  @override
  State<FoodBottomSheetWidget> createState() => _FoodBottomSheetWidgetState();
}

class _FoodBottomSheetWidgetState extends State<FoodBottomSheetWidget> {
  int _count = 0;

  void plusOrder() {
    setState(() {
      _count++;
    });
  }

  void minOrder() {
    if (_count < 1) {
      return;
    } else {
      setState(() {
        _count--;
      });
    }
  }

  void orderNow() async {
    final navigator = Navigator.of(context);

    if (_count == 0) {
      AlertDialogUtils(
        imageAssets: 'assets/image/cross.png',
        title:
            'Tidak ada jumlah item yang ingin ditambahkan, silahkan tambahkan terlebih dahulu',
      ).dialogShow(context);
    } else {
      await AlertDialogUtils(
        imageAssets: 'assets/image/sukses.png',
        title: 'Item berhasill ditambahkan sebanyak : $_count',
      ).dialogShow(context);

      navigator.push(MaterialPageRoute(
        builder: (context) {
          return CartPage(
            name: widget.name,
            price: widget.price,
            imageAssets: widget.imageAssets,
            count: _count,
          );
        },
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 3 / 4,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: AppColor.whiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    widget.imageAssets,
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppText.text24,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.orange,
                            ),
                            Text(
                              widget.rating.toString(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppText.text16.copyWith(
                                  fontWeight: AppText.fontWeight['500']),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: minOrder,
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColor.greyColor,
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.remove,
                                color: AppColor.whiteColor,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Text(
                          '$_count',
                          style: AppText.text18,
                        ),
                        const SizedBox(width: 15),
                        GestureDetector(
                          onTap: plusOrder,
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColor.primaryColor,
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.add,
                                color: AppColor.whiteColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Rp. ${widget.price}',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: AppText.text24,
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ButtonWidget(
              titleColor: AppColor.whiteColor,
              title: 'Pesan Sekarang ',
              backgroundColor:
                  _count == 0 ? AppColor.greyColor : AppColor.primaryColor,
              onTap: orderNow,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
