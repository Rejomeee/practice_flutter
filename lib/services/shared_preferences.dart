import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static final UserPreferences _instance = UserPreferences._ctor();

  factory UserPreferences() {
    return _instance;
  }

  UserPreferences._ctor();

  SharedPreferences _prefs;

  init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /* Use this function to get the shared preference */
  getData(String value) {
    return _prefs.getString(value) ?? '';
  }

  /* Use this function to set to shared preference */
  setData(String key, String value) {
    _prefs.setString(key, value);
  }

  /* Use this function to remove specific key on shared preference */
  removeData(String key) {
    _prefs.remove(key);
  }

  /* Use this function to clear all keys on shared preference */
  clearAllData() {
    _prefs.clear();
  }
}
