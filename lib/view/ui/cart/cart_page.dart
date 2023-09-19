import 'package:flutter/material.dart';
import 'package:restaurant_submission/common/routes/app_routes.dart';
import 'package:restaurant_submission/common/utils/app_color/app_color.dart';
import 'package:restaurant_submission/common/utils/app_text/app_text.dart';
import 'package:restaurant_submission/view/ui/payment/payment_page.dart';
import 'package:restaurant_submission/view/widgets/button_widget.dart';

class CartPage extends StatelessWidget {
  const CartPage({
    super.key,
    this.name,
    this.imageAssets,
    this.price,
    this.count,
    this.chair,
    this.table,
    this.imageAssetsTable,
    this.nameTable,
  });

  final String? name;
  final String? imageAssets;
  final String? imageAssetsTable;
  final String? nameTable;
  final int? price;
  final int? count;
  final int? chair;
  final int? table;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _header(),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
        child: ListView(
          children: [
            _foodCart(),
            _tableCart(),
            _additional(),
            _pricing(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: double.infinity,
        height: 150,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                width: 1,
                color: AppColor.greyColor,
              ),
            ),
            color: AppColor.whiteColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              price != null && count != null
                  ? 'Total: Rp. ${price! * count! + 25000 + 0}'
                  : 'Rp. 37000',
              style: AppText.text24,
            ),
            const SizedBox(height: 16),
            ButtonWidget(
              titleColor: AppColor.whiteColor,
              title: 'Lanjutkan',
              onTap: () {
                AppRoutes.push(context, const PaymentPage());
              },
            ),
          ],
        ),
      ),
    );
  }

  AppBar _header() {
    return AppBar(
      backgroundColor: AppColor.whiteColor,
      foregroundColor: AppColor.blackColor,
      title: Text(
        'Detail Cart',
        style: AppText.text20,
      ),
    );
  }

  Widget _foodCart() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      width: double.infinity,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Food / Drink',
              style: AppText.text20,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  imageAssets != null
                      ? imageAssets.toString()
                      : 'assets/image/menu_small.png',
                  width: 85,
                  height: 85,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name ?? 'Mie Goreng',
                      style: AppText.text18,
                    ),
                    Text(
                      price != null ? 'Rp. $price' : 'Rp. 12000',
                      style: AppText.text16.copyWith(
                        color: AppColor.greyColor,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                count != null ? count.toString() : '1',
                style: AppText.text20,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _tableCart() {
    return Container(
      margin: const EdgeInsets.only(bottom: 32),
      width: double.infinity,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Table',
              style: AppText.text20,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  imageAssetsTable != null
                      ? imageAssetsTable.toString()
                      : 'assets/image/meja_1.jpg',
                  width: 85,
                  height: 85,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nameTable ?? 'Meja Kerja',
                      style: AppText.text18,
                    ),
                    Text(
                      chair != null && table != null
                          ? '$table Table $chair chair'
                          : '1 Table 1 chair',
                      style: AppText.text16.copyWith(
                        color: AppColor.greyColor,
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

  Widget _additional() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tambahan',
            style: AppText.text20,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Text(
                  '1 x Flower',
                  style: AppText.text16,
                ),
              ),
              Text(
                'Rp. 25000',
                style: AppText.text16,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _pricing() {
    return Container(
      margin: const EdgeInsets.only(bottom: 13),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Total',
            style: AppText.text20,
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Food / Drink',
                  style: AppText.text16,
                ),
              ),
              Text(
                price != null && count != null
                    ? 'Rp. ${price! * count!}'
                    : 'Rp. 12000',
                style: AppText.text16,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Table',
                  style: AppText.text16,
                ),
              ),
              Text(
                'Rp. 0',
                style: AppText.text16,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Flower',
                  style: AppText.text16,
                ),
              ),
              Text(
                'Rp. 25000',
                style: AppText.text16,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
