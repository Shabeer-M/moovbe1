import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static Future<bool> getLoginStatus() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool('isLoggedIn') ?? false;
  }

  static Future<void> setLoginStatus(bool isLoggedIn) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('isLoggedIn', isLoggedIn);
  }

  static Future<String?> getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('token');
  }

  static Future<void> setToken(String token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('token', token);
  }
  }
