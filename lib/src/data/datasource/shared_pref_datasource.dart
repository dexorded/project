import 'package:project/core/error/shared_pref_errors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefDatasource {
  SharedPreferences? sharedPreferences;

  Future<void> saveString({
    required String key,
    required String value,
  }) async {
    await _init();

    if (sharedPreferences != null) {
      await sharedPreferences?.setString(key, value);
    } else {
      throw SharedPreferencesNotInitializated();
    }
  }

  Future<String> getString({
    required String key,
  }) async {
    await _init();

    if (sharedPreferences != null) {
      final String? data = sharedPreferences?.getString(key);

      if (data != null) {
        return data;
      }

      throw SharedPreferencesDoesNotHaveData();
    } else {
      throw SharedPreferencesNotInitializated();
    }
  }

  Future<void> _init() async {
    sharedPreferences ??= await SharedPreferences.getInstance();
  }
}
