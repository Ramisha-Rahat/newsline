import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsline/shared/utils/responsive_utils.dart';
import 'package:newsline/widgets/text_with_toggle/toggle_line.dart';

import '../../../domain/viewModel/controller/OnboardingControllers/onboarding_controller.dart';
import '../../../shared/constants/app_colors.dart';
import '../../../widgets/buttons/cutsom_button.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Responsive.padding(7)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Enable Notification',
                    style: TextStyle(
                      fontSize: Responsive.fontSize(5),
                      color: colorScheme.onSurface,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Responsive.screenHeight * 0.02),
            Text(
              'Stay Updated, never misses a story. Receive notifications for breaking news and personalized updates',
              style: TextStyle(fontSize: Responsive.fontSize(4)),
            ),
            SizedBox(height: 40),

            // Make the list scrollable in remaining space
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ToggleLine(
                    label: 'Breaking news Notification',
                  );
                },
                itemCount: 5,
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(Responsive.padding(7)),
          child: SizedBox(
            height: 60,
            width: double.infinity,
            child: CustomTextButton(
              onPressed: () {
                final onboardingController = Get.find<OnboardingController>();
                onboardingController.pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease,
                );
              },
              foregroundColor: AppColors.white,
              backgroundColor: AppColors.primary,
              borderColor: Colors.transparent,
              child: const Center(child: Text('Continue')),
            ),
          ),
        ),
      ),
    );
  }
}
