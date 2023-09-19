import 'package:flutter/material.dart';
import 'package:restaurant_submission/common/routes/app_routes.dart';
import 'package:restaurant_submission/common/utils/app_color/app_color.dart';
import 'package:restaurant_submission/common/utils/app_text/app_text.dart';
import 'package:restaurant_submission/view/ui/cart/cart_page.dart';

class DetailMenuPage extends StatefulWidget {
  const DetailMenuPage({
    super.key,
    required this.imageAssets,
    required this.totalBuy,
    required this.isLike,
    required this.name,
    required this.price,
  });

  final String imageAssets;
  final int totalBuy;
  final int isLike;
  final String name;
  final int price;

  @override
  State<DetailMenuPage> createState() => _DetailMenuPageState();
}

class _DetailMenuPageState extends State<DetailMenuPage> {
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
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              _header(context),
              _content(),
            ],
          ),
        ),
      ),
      floatingActionButton: _counter == 0 ? const SizedBox() : _bottom(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Container _header(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      width: double.infinity,
      height: 450,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            widget.imageAssets,
          ),
        ),
      ),
      child: Align(
        alignment: Alignment.topCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                AppRoutes.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.greyColor.withOpacity(0.5),
                ),
                child: const Icon(
                  Icons.arrow_back,
                  color: AppColor.whiteColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _content() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.name,
            style: AppText.text20.copyWith(
              fontWeight: AppText.fontWeight['900'],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '${widget.totalBuy} terjual  Disukai oleh ${widget.isLike}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppText.text14.copyWith(
              color: AppColor.greyColor,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Rp. ${widget.price}',
                  style: AppText.text24.copyWith(
                    color: AppColor.primaryColor,
                  ),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
    );
  }

  Widget _bottom() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: const BoxDecoration(
              color: AppColor.whiteColor,
              border: Border(
                top: BorderSide(
                  width: 1,
                  color: AppColor.greyColor,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total : $_counter',
                  style: AppText.text18,
                ),
                Text(
                  'Rp. ${_counter * widget.price}',
                  style: AppText.text18.copyWith(
                    color: AppColor.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            AppRoutes.push(
              context,
              CartPage(
                name: widget.name,
                imageAssets: widget.imageAssets,
                price: widget.price,
                count: _counter,
              ),
            );
          },
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: 1,
                  color: AppColor.greyColor,
                ),
              ),
              color: AppColor.primaryColor,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
            child: Text(
              'Checkout',
              style: AppText.text18.copyWith(
                color: AppColor.whiteColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
