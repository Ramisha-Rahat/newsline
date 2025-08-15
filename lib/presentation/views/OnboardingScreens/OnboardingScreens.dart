import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsline/presentation/views/OnboardingScreens/finishing_onboarding.dart';
import 'package:newsline/presentation/views/OnboardingScreens/profile_setup_screen.dart';
import 'package:newsline/presentation/views/OnboardingScreens/publisher_screen.dart';
import 'package:newsline/shared/utils/responsive_utils.dart';

import '../../../domain/viewModel/controller/OnboardingControllers/onboarding_controller.dart';
import '../../../shared/constants/app_colors.dart';
import 'country_selection_screen.dart';
import 'newsFeed_selection_screen.dart';
import 'notifications_screen.dart';

class OnboardingScreen extends StatelessWidget {

  OnboardingScreen({super.key});

  final OnboardingController controller = Get.put(OnboardingController());


  final List<Widget> screens= [
    CountrySelectionScreen(),
    NewsFeedSelectionScreen(),
    PublisherScreen(),
    NotificationsScreen(),
    ProfileSetupScreen(),
    FinishingOnboarding()
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Row(
              children: [
                IconButton(onPressed: (){
                  Get.back();
                },
                    icon: Icon(Icons.arrow_back, size: 25)),
                SizedBox(width: Responsive.width(2),),
                Obx(() => SizedBox(
                  width: Responsive.width(70),
                  child: LinearProgressIndicator(
                      value: controller.progress,
                      borderRadius: BorderRadius.circular(25),
                      minHeight: 12,
                      backgroundColor: Colors.grey[300],
                      color: AppColors.primary
                  ),
                ),
                ),
              ]
          ),
          const SizedBox(height: 10),
          Expanded(
              child:
                  PageView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    controller: controller.pageController,
                    itemCount: screens.length,
                    onPageChanged: controller.updatePage,
                    itemBuilder: (context, index) {
                      return screens[index];
                    },
                  )
          ),
        ],
      ),
    );
  }
}