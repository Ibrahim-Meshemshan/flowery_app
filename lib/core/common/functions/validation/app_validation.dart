import 'package:flowery/core/common/language/app_localizations.dart';
import 'package:flutter/cupertino.dart';

class AppValidation {
  AppValidation._();

  static String? validateEmail(String? value,BuildContext context) {
    RegExp emailRegex = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    if (value == null || value.trim().isEmpty) {
      return 'field_required'.tr(context);
    } else if (!emailRegex.hasMatch(value)) {
      return 'enter_valid_email'.tr(context);
    } else {
      return null;
    }
  }


  static String? validatePassword(String? val,BuildContext context) {
    RegExp passwordRegex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[\W_]).{8,}$');

    if (val == null || val.trim().isEmpty) {
      return 'field_required'.tr(context);
    } else if (!passwordRegex.hasMatch(val)) {
      return 'password_invalid'.tr(context);
    }
    return null;
  }


  static String? validateConfirmPassword(String? val, String? password,BuildContext context) {
    if (val == null ||val.trim().isEmpty) {
      return 'field_required'.tr(context);
    } else if (val != password) {
      return "passwords_do_not_match".tr(context);
    } else {
      return null;
    }
  }

  static String? validateUsername(String? val,BuildContext context) {
    RegExp usernameRegex = RegExp(r'^[a-zA-Z0-9,.-]+$');
    if (val == null) {
      return 'field_required'.tr(context);
    } else if (val.trim().isEmpty) {
      return 'field_required'.tr(context);
    } else if (!usernameRegex.hasMatch(val)) {
      return 'enter_valid_username'.tr(context);
    } else {
      return null;
    }
  }

  static String? validateFullName(String? val,BuildContext context) {
    if (val == null || val.trim().isEmpty) {
      return 'field_required'.tr(context);
    } else {
      return null;
    }
  }

  static String? validatePhoneNumber(String? value,BuildContext context) {
    if (value == null) {
      return 'field_required'.tr(context);
    } else if (int.tryParse(value.trim()) == null) {
      return 'numbers_only'.tr(context);
    } else if (value.trim().length != 13) {
      return 'must_equal_12_digit'.tr(context);
    } else {
      return null;
    }
  }
}