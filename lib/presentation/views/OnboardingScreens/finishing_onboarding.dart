import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:newsline/shared/utils/responsive_utils.dart';

import '../../../shared/constants/app_colors.dart';
import '../../../widgets/buttons/cutsom_button.dart';

class FinishingOnboarding extends StatelessWidget {
  const FinishingOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Responsive.padding(7)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.done_all_outlined, size: Responsive.screenWidth*0.2, color: AppColors.primary),
              Text(
                'You`re All Set',
                style: TextStyle(fontSize: Responsive.fontSize(5), fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'Thank you for completing the onboarding process. You can now enjoy all the features of our app  and expolore.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: Responsive.fontSize(4), color: Colors.grey[600]),
              ),
            ],
          ),
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
                Get.offAllNamed('/homePage');
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