import 'package:flutter/material.dart';
import 'package:restaurant_submission/common/utils/alert_dialog/alert_dialog.dart';
import 'package:restaurant_submission/common/utils/app_color/app_color.dart';
import 'package:restaurant_submission/common/utils/app_text/app_text.dart';
import 'package:restaurant_submission/view/ui/cart/cart_page.dart';
import 'package:restaurant_submission/view/widgets/button_widget.dart';

class TableBottomSheetWidget extends StatefulWidget {
  const TableBottomSheetWidget({
    super.key,
    required this.imageAssets,
    required this.name,
    required this.chair,
    required this.table,
  });

  final String imageAssets;
  final String name;
  final int chair;
  final int table;

  @override
  State<TableBottomSheetWidget> createState() => _TableBottomSheetWidgetState();
}

class _TableBottomSheetWidgetState extends State<TableBottomSheetWidget> {
  List<Map<String, dynamic>> listData = [
    {
      'id': 'Chair',
      'price': 'free',
      'value': false,
    },
    {
      'id': 'Table',
      'price': 'free',
      'value': false,
    },
    {
      'id': 'Flower',
      'price': 25000,
      'value': false,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: AppColor.whiteColor,
      ),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 3 / 5,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 50,
              height: 5,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: AppColor.greyColor,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Waktu',
                style: AppText.text20,
              ),
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _chipData('30 menit'),
                  _chipData('45 menit'),
                  _chipData('1 Jam'),
                  _chipData('2 Jam'),
                  _chipData('4 Jam'),
                  _chipData('5 Jam'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Tambahan',
                style: AppText.text20,
              ),
            ),
            const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              itemCount: listData.length,
              itemBuilder: (context, index) {
                return CheckboxListTile(
                  activeColor: AppColor.primaryColor,
                  value: listData[index]['value'],
                  title: Text(
                    listData[index]['id'],
                    style: AppText.text16,
                  ),
                  subtitle: Text(
                    listData[index]['price'] == 'free'
                        ? listData[index]['price']
                        : 'Rp. ${listData[index]['price']}',
                    style: AppText.text16.copyWith(
                      color: AppColor.greyColor,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      listData[index]['value'] = value;
                    });
                  },
                );
              },
            ),
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: ButtonWidget(
                titleColor: AppColor.whiteColor,
                title: 'Pesan Meja Sekarang',
                onTap: () async {
                  final navigator = Navigator.of(context);
                  await AlertDialogUtils(
                    imageAssets: 'assets/image/sukses.png',
                    title: 'Item berhasil ditambahkan',
                  ).dialogShow(context);

                  navigator.push(
                    MaterialPageRoute(
                      builder: (context) => CartPage(
                        table: widget.table,
                        chair: widget.chair,
                        imageAssetsTable: widget.imageAssets,
                        nameTable: widget.name,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _chipData(String label) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: Chip(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        label: Text(label),
        labelStyle: AppText.text14,
      ),
    );
  }
}
