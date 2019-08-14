import 'package:shared_preferences/shared_preferences.dart';

class CustomSP {
  static saveString(String name, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(name, value);
  }

  static Future<String> getString(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(name);
  }

  static saveInt(String name, int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(name, value);
  }

  static Future<int> getInt(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(name);
  }

  static saveDouble(String name, double value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble(name, value);
  }

  static Future<double> getDouble(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(name);
  }

  static saveBool(String name, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(name, value);
  }

  static Future<bool> getBool(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(name);
  }

  static clearAll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }
}
