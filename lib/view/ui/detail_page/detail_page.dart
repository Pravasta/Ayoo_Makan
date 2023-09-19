import 'package:flutter/material.dart';
import 'package:restaurant_submission/common/routes/app_routes.dart';
import 'package:restaurant_submission/common/utils/app_color/app_color.dart';
import 'package:restaurant_submission/common/utils/app_text/app_text.dart';
import 'package:restaurant_submission/model/discount_model.dart';
import 'package:restaurant_submission/model/resto_model.dart';
import 'package:restaurant_submission/view/ui/detail_menu/detail_menu_page.dart';
import 'package:restaurant_submission/view/widgets/discount_widget.dart';
import 'package:restaurant_submission/view/widgets/menu_list_widget.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    super.key,
    required this.restoModel,
  });

  final RestoModel restoModel;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool _isLike = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              _header(context),
              _information(),
              _discount(context),
              _menuResto(),
            ],
          ),
        ),
      ),
    );
  }

  Container _header(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            widget.restoModel.imageAsset,
          ),
        ),
      ),
      child: Align(
        alignment: Alignment.topCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.greyColor.withOpacity(0.5),
                  ),
                  child: const Icon(
                    Icons.search,
                    color: AppColor.whiteColor,
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.greyColor.withOpacity(0.5),
                  ),
                  child: const Icon(
                    Icons.share,
                    color: AppColor.whiteColor,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _information() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/image/success-icon.png',
                width: 30,
              ),
              const SizedBox(width: 10),
              Text(
                widget.restoModel.name,
                style: AppText.text20,
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            widget.restoModel.location,
            style: AppText.text16.copyWith(color: AppColor.greyColor),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.orange,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '${widget.restoModel.rating}  (113 Penilaian)',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppText.text18,
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _isLike = !_isLike;
                  });
                },
                icon: Icon(
                  _isLike ? Icons.favorite : Icons.favorite_border,
                  color: _isLike ? Colors.red : AppColor.blackColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Text(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book',
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: AppText.text16.copyWith(
              fontWeight: AppText.fontWeight['500'],
            ),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }

  Widget _discount(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.discount_rounded,
                color: AppColor.greyColor,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Diskon khusus menu pilihan s/d 20%',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppText.text16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 85,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: DiscountModel.listDiscount.length,
              itemBuilder: (context, index) {
                final data = DiscountModel.listDiscount[index];

                return DiscountWIdget(
                  discount: data.discount,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _menuResto() {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 20,
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Makanan',
            style: AppText.text20,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.restoModel.listFood.length,
            itemBuilder: (context, index) {
              final dataFood = widget.restoModel.listFood[index];

              return GestureDetector(
                onTap: () {
                  AppRoutes.push(
                    context,
                    DetailMenuPage(
                      isLike: dataFood.isLike,
                      totalBuy: dataFood.totalBuy,
                      imageAssets: dataFood.imageAssets,
                      name: dataFood.name,
                      price: dataFood.price,
                    ),
                  );
                },
                child: MenuListWidget(
                  imageAssets: dataFood.imageAssets,
                  name: dataFood.name,
                  price: dataFood.price,
                  totalBuy: dataFood.totalBuy,
                  isLike: dataFood.isLike,
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          Text(
            'Minuman',
            style: AppText.text20,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.restoModel.listDrink.length,
            itemBuilder: (context, index) {
              final dataDrink = widget.restoModel.listDrink[index];

              return GestureDetector(
                onTap: () {
                  AppRoutes.push(
                    context,
                    DetailMenuPage(
                      imageAssets: dataDrink.imageAssets,
                      isLike: dataDrink.isLike,
                      totalBuy: dataDrink.totalBuy,
                      name: dataDrink.name,
                      price: dataDrink.price,
                    ),
                  );
                },
                child: MenuListWidget(
                  imageAssets: dataDrink.imageAssets,
                  name: dataDrink.name,
                  price: dataDrink.price,
                  totalBuy: dataDrink.totalBuy,
                  isLike: dataDrink.isLike,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
