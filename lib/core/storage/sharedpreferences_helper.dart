import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/app_string.dart';

@module
abstract class RegisterModule {
  @preResolve
  Future<SharedPreferences> get prefs =>
      SharedPreferences.getInstance();
}

@lazySingleton
class SharedPreferencesHelper {
  final SharedPreferences _prefs;

  SharedPreferencesHelper(this._prefs);

  Future<void> saveToken(String token) async {
    await _prefs.setString(AppString.authTokenKey, token);
  }

  String? getToken() {
    return _prefs.getString(AppString.authTokenKey);
  }

  Future<void> saveRefreshToken(String token) async {
    await _prefs.setString(AppString.refreshTokenKey, token);
  }

  String? getRefreshToken() {
    return _prefs.getString(AppString.refreshTokenKey);
  }

  Future<void> clearToken() async {
    await _prefs.remove(AppString.authTokenKey);
    await _prefs.remove(AppString.refreshTokenKey);
  }

  Future<void> saveUserId(String userId) async {
    await _prefs.setString(AppString.userIdKey, userId);
  }

  String? getUserId() {
    return _prefs.getString(AppString.userIdKey);
  }

  Future<void> clearAllCache() async {
    await _prefs.clear();
  }
}


// DI without getIt & injectable
// class SharedPreferencesHelper {
//   static late SharedPreferences _preferences;
//
//   static SharedPreferences getInstance() => _preferences;
//
//   static Future<void> init() async {
//     _preferences = await SharedPreferences.getInstance();
//   }
//
//   static Future<void> saveCurrentAppLanguage(String code) async {
//     await _preferences.setString(AppString.langCodeKey, code);
//   }
//
//   static String? getCurrentAppLanguage() {
//     return _preferences.getString(AppString.langCodeKey);
//   }
//
//   static void clearAllCash() {
//     _preferences.clear();
//   }
//
//   static Future<void> saveToken(String token) async {
//     await _preferences.setString(AppString.authTokenKey, token);
//   }
//
//   static String? getToken() {
//     return _preferences.getString(AppString.authTokenKey);
//   }
//
//   static String? getRefreshToken() {
//     return _preferences.getString(AppString.refreshTokenKey);
//   }
//
//   static Future<void> clearToken() async {
//     await _preferences.remove(AppString.authTokenKey);
//     await _preferences.remove(AppString.refreshTokenKey);
//   }
//
//   static Future<void> saveUserId(String userId) async {
//     await _preferences.setString(AppString.userIdKey, userId);
//   }
//
//   static String? getUserId() {
//     return _preferences.getString(AppString.userIdKey);
//   }
//
//   static Future<void> saveRefreshToken(String refreshToken) async {
//     await _preferences.setString(AppString.refreshTokenKey, refreshToken);
//   }
//
//   static Future<void> removeRefreshToken() async {
//     await _preferences.remove(AppString.refreshTokenKey);
//   }
// }
