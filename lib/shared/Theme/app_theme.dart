import 'package:flutter/material.dart';
import 'package:newsline/shared/Theme/text_theme.dart';

import 'color_scheme.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
    brightness: Brightness.light,
    colorScheme: AppColorScheme.lightColorScheme,
    textTheme: AppTextTheme.getTextTheme(context),
    useMaterial3: true,
  );


  static ThemeData darkTheme(BuildContext context) => ThemeData(
    brightness: Brightness.dark,
    colorScheme: AppColorScheme.darkColorScheme,
    textTheme: AppTextTheme.getTextTheme(context),
    scaffoldBackgroundColor: AppColorScheme.darkColorScheme.background,
    appBarTheme: const AppBarTheme(elevation: 0),
    useMaterial3: true,
  );
}