import 'package:flutter/material.dart';
import 'package:restaurant_submission/common/routes/app_routes.dart';
import 'package:restaurant_submission/common/utils/app_text/app_text.dart';
import 'package:restaurant_submission/controller/auth_controller.dart';
import 'package:restaurant_submission/view/ui/login/login_page.dart';
import 'package:restaurant_submission/view/widgets/profile_list_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isLoading = false;
  String _name = '';
  String _email = '';

  getName() async {
    final name = await AuthController().getKey('name');
    final email = await AuthController().getKey('email');
    _name = name!;
    _email = email!;
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
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(top: 16, left: 20, right: 20),
        child: ListView(
          children: [
            _header(),
            _profile(),
            _account(),
            _moreInfo(),
            _footer(context),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      width: double.infinity,
      child: Text(
        'Profile',
        style: AppText.text24,
      ),
    );
  }

  Widget _profile() {
    return Container(
      margin: const EdgeInsets.only(bottom: 40),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/image/profile.jpg',
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppText.text20,
                ),
                Text(
                  _email,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppText.text16.copyWith(
                    fontWeight: AppText.fontWeight['500'],
                  ),
                ),
              ],
            ),
          ),
          Text(
            'Edit',
            style: AppText.text18,
          ),
        ],
      ),
    );
  }

  Widget _account() {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Akun',
            style: AppText.text16,
          ),
          const SizedBox(height: 16),
          const ProfileListWidget(
            imageAssets: 'assets/image/card.png',
            title: 'Metode Pembayaran',
          ),
          const ProfileListWidget(
            imageAssets: 'assets/image/cart(1).png',
            title: 'Keranjang Saya',
          ),
          const ProfileListWidget(
            imageAssets: 'assets/image/help-circle.png',
            title: 'Laporan dan Bantuan',
          ),
          const ProfileListWidget(
            imageAssets: 'assets/image/language.png',
            title: 'Bahasa',
          ),
          const ProfileListWidget(
            imageAssets: 'assets/image/notifications.png',
            title: 'Notifikasi',
          ),
        ],
      ),
    );
  }

  Widget _moreInfo() {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Info Lebih lanjut',
            style: AppText.text16,
          ),
          const SizedBox(height: 16),
          const ProfileListWidget(
            imageAssets: 'assets/image/shield.png',
            title: 'Pengaturan Privasi',
          ),
          const ProfileListWidget(
            imageAssets: 'assets/image/newspaper.png',
            title: 'Berita dan Service',
          ),
          const ProfileListWidget(
            imageAssets: 'assets/image/star.png',
            title: 'Berikan Penilaian',
          ),
        ],
      ),
    );
  }

  Widget _footer(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: TextButton(
          onPressed: () async {
            _isLoading = true;
            setState(() {});

            await AuthController().removeKey('name');

            await Future.delayed(
              const Duration(seconds: 2),
              () {
                AppRoutes.pushRemove(context, const LoginPage());
              },
            );
            _isLoading = false;
            setState(() {});
          },
          child: Text(
            _isLoading ? 'Loading' : 'Keluar',
            style: AppText.text18.copyWith(
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
