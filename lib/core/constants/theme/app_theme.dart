import 'package:flutter/material.dart';
import 'package:task/core/constants/app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
      scaffoldBackgroundColor: AppColors.backgroundColor,
    );
  }
}
