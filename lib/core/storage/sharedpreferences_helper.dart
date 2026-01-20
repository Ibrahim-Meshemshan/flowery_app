import 'package:shared_preferences/shared_preferences.dart';

import '../constants/app_string.dart';

class SharedPreferencesHelper {
  static late SharedPreferences _preferences;

  static SharedPreferences getInstance() => _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<void> saveCurrentAppLanguage(String code) async {
    await _preferences.setString(AppString.langCodeKey, code);
  }

  static String? getCurrentAppLanguage() {
    return _preferences.getString(AppString.langCodeKey);
  }

  static void clearAllCash() {
    _preferences.clear();
  }

  static Future<void> saveToken(String token) async {
    await _preferences.setString(AppString.authTokenKey, token);
  }

  static String? getToken() {
    return _preferences.getString(AppString.authTokenKey);
  }

  static String? getRefreshToken() {
    return _preferences.getString(AppString.refreshTokenKey);
  }

  static Future<void> clearToken() async {
    await _preferences.remove(AppString.authTokenKey);
    await _preferences.remove(AppString.refreshTokenKey);
  }

  static Future<void> saveUserId(String userId) async {
    await _preferences.setString(AppString.userIdKey, userId);
  }

  static String? getUserId() {
    return _preferences.getString(AppString.userIdKey);
  }

  static Future<void> saveRefreshToken(String refreshToken) async {
    await _preferences.setString(AppString.refreshTokenKey, refreshToken);
  }

  static Future<void> removeRefreshToken() async {
    await _preferences.remove(AppString.refreshTokenKey);
  }
}
