import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:newsline/widgets/buttons/cutsom_button.dart';
import '../../../shared/utils/responsive_utils.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Image.asset(
                'assets/images/logo.png',
                height: Responsive.height(25), // 25% of screen height
              ),
              SizedBox(height: Responsive.height(2)),

              // Title
              Text(
                'NEWSLINE',
                style: textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: Responsive.fontSize(7), // 7% of width
                  color: colorScheme.onBackground,
                ),
              ),
              SizedBox(height: Responsive.height(2)),

              // Subtitle
              Text(
                'Welcome, Let’s dive into your account',
                style: textTheme.bodyLarge?.copyWith(
                  fontSize: Responsive.fontSize(4),
                  color: colorScheme.onBackground.withOpacity(0.7),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: Responsive.height(6)),

              // Google Button
              SizedBox(
                height: Responsive.height(7),
                width: Responsive.width(90),
                child: CustomTextButton(
                  onPressed: () {},
                  foregroundColor: colorScheme.onSurface,
                  backgroundColor: colorScheme.surface,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/google-color-svgrepo-com.svg',
                        height: Responsive.height(4),
                      ),
                      SizedBox(width: Responsive.width(3)),
                      Text(
                        'Continue With Google',
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: Responsive.fontSize(4),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: Responsive.height(2)),


              SizedBox(
                height: Responsive.height(7),
                width: Responsive.width(90),
                child: CustomTextButton(
                  onPressed: () {},
                  foregroundColor: colorScheme.onSurface,
                  backgroundColor: colorScheme.surface,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/facebook-color-svgrepo-com.svg',
                        height: Responsive.height(4),
                      ),
                      SizedBox(width: Responsive.width(3)),
                      Text(
                        'Continue With Facebook',
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: Responsive.fontSize(4),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: Responsive.height(20)),

              // Sign In Button
              SizedBox(
                height: Responsive.height(7),
                width: Responsive.width(90),
                child: CustomTextButton(
                  onPressed: () {
                    Get.toNamed('/signIn');
                  },
                  foregroundColor: colorScheme.onPrimary,
                  backgroundColor: colorScheme.primary,
                  borderColor: Colors.transparent,
                  child: Center(
                    child: Text(
                      'Sign In With Password',
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: Responsive.fontSize(4),
                        color: Colors.white
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: Responsive.height(6)),

              // Sign Up link
              RichText(
                text: TextSpan(
                  text: "Don't have an Account? ",
                  style: textTheme.bodyMedium?.copyWith(
                    fontSize: Responsive.fontSize(3.5),
                    color: colorScheme.onBackground.withOpacity(0.8),
                  ),
                  children: [
                    TextSpan(
                      text: 'Sign Up',
                      style: textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: Responsive.fontSize(3.5),
                        color: colorScheme.primary,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.toNamed('/signUp');
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
