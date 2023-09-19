import 'package:flutter/material.dart';
import 'package:restaurant_submission/common/utils/alert_dialog/alert_dialog.dart';
import 'package:restaurant_submission/common/utils/app_color/app_color.dart';
import 'package:restaurant_submission/common/utils/app_text/app_text.dart';
import 'package:restaurant_submission/common/utils/loading_dialog/loading_dialog.dart';
import 'package:restaurant_submission/view/ui/succes/succes_page.dart';
import 'package:restaurant_submission/view/widgets/button_widget.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  int _newValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _header(),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
            child: Column(
              children: [
                _paymentList('assets/image/payment_3.png', 'ATM Bersama', 1),
                _paymentList('assets/image/payment_2.png', 'Gopay', 2),
                _paymentList('assets/image/payment_1.png', 'Link Aja', 3),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 1,
                    color: AppColor.greyColor,
                  ),
                ),
              ),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              child: ButtonWidget(
                titleColor: AppColor.whiteColor,
                backgroundColor:
                    _newValue == 0 ? AppColor.greyColor : AppColor.primaryColor,
                height: 60,
                title: 'Bayar Sekarang',
                onTap: () async {
                  final navigator = Navigator.of(context);

                  if (_newValue == 0) {
                    await AlertDialogUtils(
                      imageAssets: 'assets/image/cross.png',
                      title: 'Silahkan pilih salah satu metode pembayaran',
                    ).dialogShow(context);
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return LoadingDialog.loadingDialog(context);
                      },
                    ).then((value) {
                      navigator.push(
                        MaterialPageRoute(
                          builder: (context) => const SuccesPage(),
                        ),
                      );
                    });
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column _paymentList(
    String imageAssets,
    String title,
    int value,
  ) {
    return Column(
      children: [
        RadioListTile(
          activeColor: AppColor.primaryColor,
          value: value,
          title: Row(
            children: [
              Image.asset(
                imageAssets,
                width: 50,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppText.text18.copyWith(
                    fontWeight: AppText.fontWeight['500'],
                  ),
                ),
              ),
            ],
          ),
          groupValue: _newValue,
          onChanged: (value) {
            _newValue = value!;
            setState(() {});
          },
        ),
        const Divider(
          thickness: 1,
          indent: 70,
          color: AppColor.greyColor,
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  AppBar _header() {
    return AppBar(
      foregroundColor: AppColor.blackColor,
      backgroundColor: AppColor.whiteColor,
      title: Text(
        'Payment Method',
        style: AppText.text20,
      ),
    );
  }
}
