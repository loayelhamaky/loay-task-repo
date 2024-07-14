import 'package:flutter/material.dart';
import 'app_colors.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        color: AppColors.primary,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        color: AppColors.primary,
        fontSize: 16,
      ),
    ),
  );
}
