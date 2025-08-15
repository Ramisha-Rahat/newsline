import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../domain/viewModel/controller/OnboardingControllers/onboarding_controller.dart';
import '../../../shared/constants/app_colors.dart';
import '../../../shared/utils/responsive_utils.dart';
import '../../../widgets/buttons/cutsom_button.dart';

class NewsFeedSelectionScreen extends StatelessWidget {
  const NewsFeedSelectionScreen({super.key});

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
                    text: 'Customize your news feed ',
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
              'Tell us what you are interested in tailoring to track your news experience',
              style: TextStyle(fontSize: Responsive.fontSize(4)),
            ),

            SizedBox(height: Responsive.screenHeight * 0.02),

            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: List.generate(10, (index) {
                  return Container(
                    child: Center(
                      child: Text(
                        'Item $index',
                        style: TextStyle(fontSize: Responsive.fontSize(2)),
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: colorScheme.onSurface),
                        left: BorderSide(color: colorScheme.onSurface),
                        right: BorderSide(color: colorScheme.onSurface),
                        bottom: BorderSide(color: colorScheme.onSurface),
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(height: Responsive.screenHeight * 0.01),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: Responsive.padding(7)),
        child: SizedBox(
          height: 60,
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
    );
  }
}
