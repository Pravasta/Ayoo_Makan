import 'package:flutter/material.dart';
import 'package:restaurant_submission/common/utils/app_color/app_color.dart';
import 'package:restaurant_submission/common/utils/app_text/app_text.dart';
import 'package:restaurant_submission/view/ui/home/home_page.dart';
import 'package:restaurant_submission/view/ui/profile/profile_page.dart';
import 'package:restaurant_submission/view/ui/recent/recent_page.dart';
import 'package:restaurant_submission/view/ui/search/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    super.key,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  List<Widget> _widget = [];

  @override
  void initState() {
    super.initState();

    _widget = [
      const HomePage(),
      const SearchPage(),
      const RecentPage(),
      const ProfilePage(),
    ];
  }

  void onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widget[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        elevation: 4,
        selectedLabelStyle: AppText.text18,
        unselectedLabelStyle: AppText.text18,
        selectedItemColor: AppColor.primaryColor,
        backgroundColor: AppColor.whiteColor,
        onTap: onTap,
        items: [
          _bottomItem('assets/image/home.png', 'Home'),
          _bottomItem('assets/image/search.png', 'Search'),
          _bottomItem('assets/image/refresh-circle.png', 'Recent'),
          _bottomItem('assets/image/person.png', 'Profile'),
        ],
      ),
    );
  }

  BottomNavigationBarItem _bottomItem(String imageAsset, String label) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        imageAsset,
        color: AppColor.greyColor,
        width: 35,
      ),
      label: label,
      activeIcon: Image.asset(
        imageAsset,
        color: AppColor.primaryColor,
        width: 35,
      ),
    );
  }
}
