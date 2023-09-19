import 'package:flutter/material.dart';
import 'package:restaurant_submission/common/routes/app_routes.dart';
import 'package:restaurant_submission/common/utils/app_color/app_color.dart';
import 'package:restaurant_submission/common/utils/app_text/app_text.dart';
import 'package:restaurant_submission/model/food_model.dart';
import 'package:restaurant_submission/view/ui/cart/cart_page.dart';
import 'package:restaurant_submission/view/widgets/food_bottom_sheet_widget.dart';
import 'package:restaurant_submission/view/widgets/food_widget.dart';
import 'package:restaurant_submission/view/widgets/search_field_widget.dart';

class FoodPage extends StatelessWidget {
  const FoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _header(context),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
        child: _content(),
      ),
    );
  }

  ListView _content() {
    return ListView(
      children: [
        const SearchFieldWidget(
          hintText: 'Cari makanan',
        ),
        Container(
          margin: const EdgeInsets.only(top: 24, bottom: 32),
          width: double.infinity,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _chipData('Makan Malam'),
                _chipData('Makanan Cepat Saji'),
                _chipData('Makanan Panas'),
                _chipData('Makanan Keluarga'),
                _chipData('Menu Ayam'),
                _chipData('Menu Sapi'),
              ],
            ),
          ),
        ),
        GridView.builder(
          itemCount: 6,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) {
            final FoodModel data = FoodModel.listFood[index];

            return GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) {
                    return FoodBottomSheetWidget(
                      imageAssets: data.imageAssets,
                      name: data.name,
                      price: data.price,
                      rating: data.rating,
                    );
                  },
                );
              },
              child: FoodWidget(
                name: data.name,
                price: data.price,
                rating: data.rating,
                imageAssets: data.imageAssets,
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _chipData(String title) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: Chip(
        label: Text(title),
        labelStyle: AppText.text14,
      ),
    );
  }

  AppBar _header(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.whiteColor,
      title: Text(
        'Food',
        style: AppText.text20,
      ),
      leading: IconButton(
        onPressed: () {
          AppRoutes.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          color: AppColor.blackColor,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            AppRoutes.push(context, const CartPage());
          },
          icon: Image.asset(
            'assets/image/cart(1).png',
            color: AppColor.blackColor,
          ),
        ),
      ],
    );
  }
}
