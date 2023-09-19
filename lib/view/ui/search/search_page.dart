import 'package:flutter/material.dart';
import 'package:restaurant_submission/common/routes/app_routes.dart';
import 'package:restaurant_submission/common/utils/app_text/app_text.dart';
import 'package:restaurant_submission/model/resto_model.dart';
import 'package:restaurant_submission/view/ui/detail_page/detail_page.dart';
import 'package:restaurant_submission/view/widgets/resto_widget.dart';
import 'package:restaurant_submission/view/widgets/search_field_widget.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        width: double.infinity,
        child: ListView(
          children: [
            _header(),
            _popular(),
            _recent(),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Search',
            style: AppText.text24,
          ),
          const SizedBox(height: 40),
          const SearchFieldWidget(
              hintText: 'Cari makanan, meja, atau apapun disini'),
        ],
      ),
    );
  }

  Widget _popular() {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pencarian Populer',
            style: AppText.text20,
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 10,
            children: [
              _wrapData('Mie Ayam'),
              _wrapData('Bakso'),
              _wrapData('Nasi Goreng'),
              _wrapData('Ayam Goreng'),
              _wrapData('Bebek Goreng'),
              _wrapData('Sei Sapi'),
              _wrapData('Martabak Telur'),
            ],
          )
        ],
      ),
    );
  }

  Chip _wrapData(String title) {
    return Chip(
      label: Text(title),
      labelStyle: AppText.text14,
    );
  }

  Widget _recent() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pencarian Terakhir',
            style: AppText.text20,
          ),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              childAspectRatio: 0.8,
              crossAxisSpacing: 0,
            ),
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
                  width: MediaQuery.of(context).size.width / 2,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
