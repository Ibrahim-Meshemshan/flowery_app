import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData lightMode = ThemeData(
    canvasColor: AppColors.primaryLight,
    primaryColor: AppColors.primaryLight,
    scaffoldBackgroundColor: AppColors.whiteColor,
    // appBarTheme: AppBarTheme(
    //   backgroundColor: AppColors.primaryColor,
    //   elevation: 0,
    //   centerTitle: true,
    //   iconTheme: IconThemeData(color: AppColors.blackColor),
    // ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.primaryLight,
      selectedItemColor: AppColors.blackColor,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),

      bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
      bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
    ),
  );

  static ThemeData darkMode = ThemeData(
    canvasColor: AppColors.primaryDark,
    primaryColor: AppColors.primaryDark,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.whiteColor),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.primaryDark,
      selectedItemColor: AppColors.yellowColor,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: AppColors.whiteColor,
      ),
      titleMedium: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w500,
        color: AppColors.whiteColor,
      ),
      titleSmall: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w400,
        color: AppColors.whiteColor,
      ),
    ),
  );
}
