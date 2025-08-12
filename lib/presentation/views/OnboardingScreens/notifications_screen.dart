import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsline/widgets/text_with_toggle/toggle_line.dart';

import '../../../domain/viewModel/controller/OnboardingControllers/onboarding_controller.dart';
import '../../../shared/constants/app_colors.dart';
import '../../../widgets/buttons/cutsom_button.dart';


class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Enable Notification',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(text: ' 👩‍💻 ', style: TextStyle(fontSize: 35)),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Stay Updated, never misses a story.Receive notifications for breaking news and personalized updates',
            ),

            SizedBox(height: 40),
            
         
            ListView.builder
            (itemBuilder: 
                (context, index) {
              return Padding( 
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ToggleLine(
                  label: 'Breaking news Notification',
                ),
              );
                },
                itemCount: 5,
                shrinkWrap: true,
            ),

            Spacer(),

            SizedBox(
              height: 60,
              width: 350,
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
          ],
        ),
      ),
    );
  }
}
