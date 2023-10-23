import 'package:shared_preferences/shared_preferences.dart';

class LocalizationHelper {
  static Future<void> setLocale(String currentLocale) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('locale', currentLocale);
  }

  static Future<String> getLocale() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var val = preferences.getString("locale") ?? "";

    return val;
  }
}
