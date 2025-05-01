import 'package:flutter/material.dart';
import '../colors/colors.dart'; // adjust the path to your AppColors

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Gilroy',
    primaryColor: AppColors.primaryGreen,
    scaffoldBackgroundColor: AppColors.background,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: AppColors.primaryDark,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: TextStyle(
        color: AppColors.textGrey,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AppColors.primaryGreen,
    ),
  );
}
