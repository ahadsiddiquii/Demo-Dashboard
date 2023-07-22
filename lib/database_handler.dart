import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  static final Storage _singleton = Storage._internal();
  static SharedPreferences _sharedPreferences =
      SharedPreferences.getInstance() as SharedPreferences;
  factory Storage() {
    return _singleton;
  }
  static initialize() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return true;
  }

  static setValue(String key, String value) {
    _sharedPreferences.setString(key, value);
  }

  static bool containsValue(String key) {
    return _sharedPreferences.containsKey(key);
  }

  static getValue(String key) {
    if (_sharedPreferences.containsKey(key)) {
      return _sharedPreferences.getString(key);
    } else {
      return 'error';
    }
  }

  static cleanData() {
    return _sharedPreferences.clear();
  }

  Storage._internal();
}
