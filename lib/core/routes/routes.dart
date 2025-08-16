import 'package:get/get.dart';
import 'package:newsline/core/bindings/HomeScreenBindings/profile_bindings.dart';
import 'package:newsline/core/bindings/responsive_naviagtion_bindings.dart';
import 'package:newsline/core/routes/route_names.dart';
import 'package:newsline/presentation/views/SplashScreen/splash_screen.dart';
import 'package:newsline/presentation/views/profileView/edit_profile_page.dart';
import 'package:newsline/presentation/views/responsive_navigation_screen.dart';
import '../../presentation/views/AuthenticationScreens/forgotPassword/onboarding_forgot_password.dart';
import '../../presentation/views/AuthenticationScreens/signIn_screen.dart';
import '../../presentation/views/AuthenticationScreens/signup_screen.dart';
import '../../presentation/views/AuthenticationScreens/welcome_screen.dart';
import '../../presentation/views/OnboardingScreens/OnboardingScreens.dart';
import '../bindings/AuthenticationBindings/forgot_password_binding.dart';
import '../bindings/AuthenticationBindings/signIn_bindings.dart';
import '../bindings/AuthenticationBindings/signUp_bindings.dart';
import '../bindings/OnboardingBindings/onboarding_bindings.dart';
import '../bindings/ThemeBindings/theme_bindings.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: RouteNames.home,
      page: () => WelcomeScreen(),
      binding: ThemeBinding(),
    ),
    //auth
    GetPage(
      name: RouteNames.signIn,
      page: () => SignInScreen(),
      binding: SignInBindings(),
    ),
    GetPage(
      name: RouteNames.signUp,
      page: () => SignupScreen(),
      binding: SignUpBinding(),
    ),

    //reset password
    GetPage(
      name: RouteNames.onboardingResetPasswordScreen,
      page: () => OnboardingForgotPassword(),
      binding: ForgotPasswordBinding(),
    ),

    //onboarding
    GetPage(
      name: RouteNames.onBoardingScreen,
      page: () => OnboardingScreen(),
      binding: OnboardingBindings(),
    ),

    ///home page
    GetPage(
      name: RouteNames.homePage,
      page: () => ResponsiveNavigationScreen(),
      binding: ResponsiveNavigationBindings(),

      //  HomeScreenBindings(),
    ),

    GetPage(name: RouteNames.splashScreen, page: () => SplashScreen()),

    GetPage(name: RouteNames.editProfileScreen, page: () => EditProfilePage(), binding: ProfileScreenBindings()),
  ];
}
