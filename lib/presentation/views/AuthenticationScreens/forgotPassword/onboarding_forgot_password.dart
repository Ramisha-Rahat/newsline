import 'package:flutter/material.dart';
import 'package:newsline/domain/viewModel/controller/AuthControllers/forgot_password_controller.dart';
import 'package:get/get.dart';

import '../../../../shared/constants/app_colors.dart';
import '../../../../shared/utils/responsive_utils.dart';
import 'forgot_password.dart';
import 'new_password_screen.dart';
import 'otp_change_password.dart';

class OnboardingForgotPassword extends StatelessWidget {
 OnboardingForgotPassword({super.key});

 final ForgotPasswordController controller=Get.put(ForgotPasswordController());

   final List<Widget> resetPasswordScreens= [
    ForgotPassword(),
    OtpChangePassword(),
    NewPasswordScreen(),
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
                itemCount: resetPasswordScreens.length,
                onPageChanged: controller.updatePage,
                itemBuilder: (context, index) {
                  return resetPasswordScreens[index];
                },
              )
          ),
        ],
      ),
    );
  }
}