import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppColorScheme {
  static const lightColorScheme = ColorScheme.light(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    background: AppColors.lightBackground,
    surface: AppColors.lightSurface, // light grey for cards/buttons
    onPrimary: AppColors.white,
    onSecondary: AppColors.black,
    onBackground: AppColors.lightText,
    onSurface: AppColors.black,
    brightness: Brightness.light,
  );

  static const darkColorScheme = ColorScheme.dark(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    background: AppColors.darkBackground, // pure dark background
    surface: Color(0xFF2C2C2C), // lighter grey for better contrast in dark mode
    onPrimary: AppColors.white,
    onSecondary: AppColors.white,
    onBackground: AppColors.darkText,
    onSurface: AppColors.white,
    brightness: Brightness.dark,
  );
}
