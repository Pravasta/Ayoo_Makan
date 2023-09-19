import 'package:flutter/material.dart';
import 'package:restaurant_submission/common/routes/app_routes.dart';
import 'package:restaurant_submission/common/utils/app_color/app_color.dart';
import 'package:restaurant_submission/common/utils/app_text/app_text.dart';
import 'package:restaurant_submission/view/ui/main/main_page.dart';
import 'package:restaurant_submission/view/widgets/button_widget.dart';
import 'package:restaurant_submission/view/widgets/text_field_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;
  bool _showPassword = false;
  final _formState = GlobalKey<FormState>();
  final TextEditingController _nameC = TextEditingController();
  final TextEditingController _emailC = TextEditingController();
  final TextEditingController _passC = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nameC.dispose();
    _emailC.dispose();
    _passC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _body(context),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0.7,
      backgroundColor: AppColor.whiteColor,
      title: Text(
        'Login',
        style: AppText.text20,
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Form(
        key: _formState,
        child: ListView(
          children: [
            TextFieldWidget(
              label: "Nama",
              controller: _nameC,
              validator: (name) {
                if (name == null || name.isEmpty || name.length <= 6) {
                  return 'Nama harus memiliki setidaknya 6 karakter';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFieldWidget(
              label: 'Email',
              controller: _emailC,
              validator: (email) {
                if (email == null || email.isEmpty || !email.contains('@')) {
                  return 'Mohon masukkan email dengan benar';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFieldWidget(
              label: 'Password',
              controller: _passC,
              validator: (password) {
                if (password == null ||
                    password.isEmpty ||
                    password.length <= 6) {
                  return 'Nama harus memiliki setidaknya 6 karakter';
                }
                return null;
              },
              onPressed: () {
                _showPassword = !_showPassword;
                setState(() {});
              },
              obsText: _showPassword ? false : true,
              icon: _showPassword
                  ? const Icon(Icons.visibility_off_rounded)
                  : const Icon(Icons.visibility_rounded),
            ),
            const SizedBox(height: 40),
            ButtonWidget(
              titleColor: AppColor.whiteColor,
              title: _isLoading ? 'Loading...' : 'Masuk',
              onTap: () async {
                final prefs = await SharedPreferences.getInstance();

                if (_formState.currentState != null) {
                  if (_formState.currentState!.validate()) {
                    setState(() {
                      _isLoading = true;
                    });

                    await prefs.setString('name', _nameC.text.trim());
                    await prefs.setString('email', _emailC.text.trim());

                    await Future.delayed(
                      const Duration(seconds: 2),
                      () {
                        AppRoutes.pushRemove(
                          context,
                          const MainPage(),
                        );
                      },
                    );
                    setState(() {
                      _isLoading = false;
                    });
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
