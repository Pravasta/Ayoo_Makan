import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  Future<String?> getKey(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(seconds: 2));
    String? value = prefs.getString(name);

    return value;
  }

  Future<bool?> removeKey(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(seconds: 2));
    var value = prefs.remove(name);

    return value;
  }
}
