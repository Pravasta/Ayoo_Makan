import 'package:flutter/material.dart';
import 'package:restaurant_submission/common/routes/app_routes.dart';
import 'package:restaurant_submission/common/utils/app_color/app_color.dart';
import 'package:restaurant_submission/common/utils/app_text/app_text.dart';
import 'package:restaurant_submission/model/table_model.dart';
import 'package:restaurant_submission/view/ui/cart/cart_page.dart';
import 'package:restaurant_submission/view/widgets/search_field_widget.dart';
import 'package:restaurant_submission/view/widgets/table_bottom_sheet_widget.dart';
import 'package:restaurant_submission/view/widgets/table_widget.dart';

class TablePage extends StatelessWidget {
  const TablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _header(context),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: ListView(
          children: [
            const SearchFieldWidget(hintText: 'Search Table'),
            Container(
              margin: const EdgeInsets.only(top: 24, bottom: 32),
              width: double.infinity,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _chipData('Satu Meja'),
                    _chipData('Dua Meja'),
                    _chipData('Meja Kerja'),
                    _chipData('Meja Keluarga'),
                    _chipData('Meja Spesial'),
                    _chipData('Meja Bundar'),
                    _chipData('Meja Panjang'),
                  ],
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: TableModel.listTable.length,
              itemBuilder: (context, index) {
                TableModel data = TableModel.listTable[index];

                return GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) {
                        return TableBottomSheetWidget(
                          chair: data.chair,
                          imageAssets: data.imageAssets,
                          name: data.name,
                          table: data.table,
                        );
                      },
                    );
                  },
                  child: TableWidget(
                    chair: data.chair,
                    imageAssets: data.imageAssets,
                    name: data.name,
                    table: data.table,
                  ),
                );
              },
            ),
          ],
        ),
      ),
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
      foregroundColor: AppColor.blackColor,
      title: Text(
        'Table',
        style: AppText.text20,
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
