import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static late final SharedPreferences _instance;

  static const keyUsername = 'username';
  static const keyPassword = 'password';

  static Future<SharedPreferences> init() async =>
      _instance = await SharedPreferences.getInstance();

  String? getUserName(String key) {
    return _instance.getString(key);
    //  return _instance.setString(keyUsername, value);
  }

  void setUserName(String key, String value) {
    _instance.setString(key, value);
  }

  logout() async {
    _instance.clear();
  }
}
