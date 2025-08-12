import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsline/core/routes/routes.dart';
import 'package:newsline/shared/Theme/app_theme.dart';
import 'package:newsline/shared/utils/responsive_utils.dart';
import 'core/routes/route_names.dart';
import 'domain/viewModel/controller/ThemeController/theme_controller.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeController themeController = Get.put(ThemeController());
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(context),
      darkTheme: AppTheme.darkTheme(context),
      themeMode: themeController.theme,
      initialRoute: RouteNames.home,
     getPages: AppRoutes.routes,

    );
  }
}