import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppColorScheme {
  static const lightColorScheme = ColorScheme.light(
    primary: AppColors.primary,          // your teal color (0xFF1A998E)
    secondary: AppColors.secondary,      // your lighter teal (0xFF82CEC6)
    background: AppColors.lightBackground, // white
    surface: AppColors.tertiary,         // light teal (0xFFE0F2F1)
    onPrimary: AppColors.white,           // white text/icons on primary
    onSecondary: AppColors.black,         // black text/icons on secondary
    onBackground: AppColors.lightText,    // black text on background
    onSurface: AppColors.black,
    brightness: Brightness.light,
  );

  static const darkColorScheme = ColorScheme.dark(
    primary: AppColors.primary,            // same primary teal for dark mode
    secondary: AppColors.secondary,
    background: AppColors.darkBackground, // dark background (0xFF121212)
    surface: Color(0xFF263238),            // darker surface color (optional)
    onPrimary: AppColors.darkText,         // white text/icons on primary
    onSecondary: AppColors.darkText,
    onBackground: AppColors.darkText,
    onSurface: AppColors.white,
    brightness: Brightness.dark,
  );
}
