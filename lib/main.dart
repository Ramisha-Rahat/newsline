// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:newsline/core/routes/routes.dart';
// import 'package:newsline/domain/viewModel/controller/AuthControllers/signIn_controllers.dart';
// import 'package:newsline/domain/viewModel/controller/AuthControllers/signUp_controllers.dart';
// import 'package:newsline/domain/viewModel/controller/HomeScreenControllers/homeScreenControllers.dart';
// import 'package:newsline/shared/Theme/app_theme.dart';
// import 'package:newsline/shared/utils/responsive_utils.dart';
// import 'core/routes/route_names.dart';
// import 'domain/viewModel/controller/ThemeController/theme_controller.dart';
//
// void main() async {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   final ThemeController themeController = Get.put(ThemeController());
//   MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     Responsive.init(context);
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: AppTheme.lightTheme(context),
//       darkTheme: AppTheme.darkTheme(context),
//       themeMode: ThemeMode.system,
//       initialRoute: RouteNames.splashScreen,
//      getPages: AppRoutes.routes,
//
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsline/core/routes/routes.dart';
import 'package:newsline/core/routes/route_names.dart';
import 'package:newsline/shared/Theme/app_theme.dart';
import 'package:newsline/shared/utils/responsive_utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        Responsive.init(context);

        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme(context),
          darkTheme: AppTheme.darkTheme(context),
          themeMode: ThemeMode.system,
          // initialRoute: RouteNames.splashScreen,
          initialRoute: RouteNames.homePage,
          getPages: AppRoutes.routes,
        );
      },
    );
  }
}
