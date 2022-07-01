import 'package:shared_preferences/shared_preferences.dart';

class Store {
  static late final SharedPreferences instance;

  static Future<SharedPreferences> init() async =>
      instance = await SharedPreferences.getInstance();
}
