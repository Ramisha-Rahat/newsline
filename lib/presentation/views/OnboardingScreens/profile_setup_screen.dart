import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../domain/viewModel/controller/OnboardingControllers/onboarding_controller.dart';
import '../../../shared/constants/app_colors.dart';
import '../../../shared/utils/responsive_utils.dart';
import '../../../widgets/buttons/cutsom_button.dart';

class ProfileSetupScreen extends StatelessWidget {
  const ProfileSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Responsive.padding(7)),
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Create Public Profile ',
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
              'The profile will be publicly visible to other users. You can change it later.',
              style: TextStyle(fontSize: Responsive.fontSize(4)),
            ),
            SizedBox(height: Responsive.screenHeight * 0.03),

            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey[300],
              child: Icon(Icons.person, size: 50, color: Colors.grey[700]),
            ),

            const SizedBox(height: 20),

            Form(
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Full Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'UserName',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Bio',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 3,
                  ),
                ],
              ),
            ),

            SizedBox(height: Responsive.screenHeight * 0.01),
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
