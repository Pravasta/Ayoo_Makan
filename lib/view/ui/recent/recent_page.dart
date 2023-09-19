import 'package:flutter/material.dart';
import 'package:restaurant_submission/common/utils/app_color/app_color.dart';
import 'package:restaurant_submission/common/utils/app_text/app_text.dart';
import 'package:restaurant_submission/view/ui/recent/feature/new_tab.dart';
import 'package:restaurant_submission/view/ui/recent/feature/old_tab.dart';

class RecentPage extends StatelessWidget {
  const RecentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            child: Column(
              children: [
                _header(),
                _tabbar(),
                _content(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      width: double.infinity,
      child: Text(
        'Recent',
        style: AppText.text24,
      ),
    );
  }

  Widget _tabbar() {
    return SizedBox(
      width: double.infinity,
      child: TabBar(
        labelColor: AppColor.primaryColor,
        labelStyle: AppText.text16,
        unselectedLabelColor: AppColor.greyColor,
        unselectedLabelStyle: AppText.text16,
        indicator: const UnderlineTabIndicator(
          borderSide: BorderSide(
            width: 4,
            color: AppColor.primaryColor,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(13),
            topRight: Radius.circular(13),
          ),
        ),
        tabs: const [
          Tab(
            child: Text(
              'Terbaru',
            ),
          ),
          Tab(
            child: Text(
              'Selesai',
            ),
          )
        ],
      ),
    );
  }

  Widget _content() {
    return const Expanded(
      child: TabBarView(
        children: [
          NewTab(),
          OldTab(),
        ],
      ),
    );
  }
}
