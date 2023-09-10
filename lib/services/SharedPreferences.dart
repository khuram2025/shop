import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static Future<void> saveTokenToPrefs(String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('auth_token', token);
  }

  static Future<String?> getTokenFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  static Future<void> removeTokenFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('auth_token');
  }

  static Future<bool> isUserLoggedIn() async {
    final token = await getTokenFromPrefs();
    return token != null && token.isNotEmpty;
  }
}
