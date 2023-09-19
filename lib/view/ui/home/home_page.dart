import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_submission/common/routes/app_routes.dart';
import 'package:restaurant_submission/common/utils/alert_dialog/alert_dialog.dart';
import 'package:restaurant_submission/common/utils/app_color/app_color.dart';
import 'package:restaurant_submission/common/utils/app_text/app_text.dart';
import 'package:restaurant_submission/controller/auth_controller.dart';
import 'package:restaurant_submission/model/banner_model.dart';
import 'package:restaurant_submission/model/resto_model.dart';
import 'package:restaurant_submission/view/ui/cart/cart_page.dart';
import 'package:restaurant_submission/view/ui/detail_page/detail_page.dart';
import 'package:restaurant_submission/view/ui/food/food_page.dart';
import 'package:restaurant_submission/view/ui/payment/payment_page.dart';
import 'package:restaurant_submission/view/ui/table/table_page.dart';
import 'package:restaurant_submission/view/widgets/resto_widget.dart';
import 'package:restaurant_submission/view/widgets/service_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _state = 0;
  String _name = '';
  final CarouselController _carouselController = CarouselController();

  getName() async {
    final name = await AuthController().getKey('name');
    _name = name!;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: ListView(
          children: [
            _header(),
            _banner(context),
            _service(),
            _recommendation(),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi, $_name',
                  style: AppText.text24,
                ),
                Text(
                  'Silahkan pilih makan kesukaan mu',
                  style: AppText.text16.copyWith(
                    fontWeight: AppText.fontWeight['500'],
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              AppRoutes.push(context, const CartPage());
            },
            child: Image.asset(
              'assets/image/cart.png',
              width: 30,
            ),
          ),
        ],
      ),
    );
  }

  Widget _banner(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 40),
      width: double.infinity,
      child: Column(
        children: [
          CarouselSlider(
            items: BannerImage.listBannerImage
                .map(
                  (e) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage(e),
                      ),
                    ),
                  ),
                )
                .toList(),
            options: CarouselOptions(
              viewportFraction: 1,
              initialPage: 0,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                _state = index;
                setState(() {});
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: BannerImage.listBannerImage.asMap().entries.map((e) {
              return GestureDetector(
                onTap: () => _carouselController.animateToPage(e.key),
                child: Container(
                  width: 12,
                  height: 12,
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _state == e.key
                        ? AppColor.primaryColor
                        : AppColor.greyColor,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _service() {
    return Container(
      margin: const EdgeInsets.only(bottom: 40),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ServiceWidget(
            imageAssets: 'assets/image/food.png',
            title: 'Makan',
            onTap: () {
              AppRoutes.push(context, const FoodPage());
            },
          ),
          ServiceWidget(
            imageAssets: 'assets/image/table.png',
            title: 'Meja',
            onTap: () {
              AppRoutes.push(context, const TablePage());
            },
          ),
          ServiceWidget(
            imageAssets: 'assets/image/payment.png',
            title: 'Bayar',
            onTap: () {
              AppRoutes.push(context, const PaymentPage());
            },
          ),
          ServiceWidget(
            imageAssets: 'assets/image/more.png',
            title: 'Lainnya',
            onTap: () async {
              await AlertDialogUtils(
                imageAssets: 'assets/image/cross.png',
                title: 'Mohon maaf, Feature ini sementara belum tersedia!',
              ).dialogShow(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _recommendation() {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Rekomendasi',
            style: AppText.text20,
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 350,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: RestoModel.listResto.length,
              itemBuilder: (context, index) {
                final RestoModel data = RestoModel.listResto[index];
                return GestureDetector(
                  onTap: () => AppRoutes.push(
                    context,
                    DetailPage(
                      restoModel: data,
                    ),
                  ),
                  child: RestoWidget(
                    name: data.name,
                    location: data.location,
                    price: data.price,
                    rating: data.rating,
                    imageAssets: data.imageAsset,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
