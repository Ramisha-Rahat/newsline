import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/viewModel/controller/AuthControllers/forgot_password_controller.dart';
import '../../../../shared/constants/app_colors.dart';
import '../../../../shared/utils/responsive_utils.dart';
import '../../../../widgets/buttons/cutsom_button.dart';
import '../../../../widgets/cards/success_card.dart';

class NewPasswordScreen extends StatelessWidget {
  NewPasswordScreen({super.key});

  final controller = Get.find<ForgotPasswordController>();

  @override
  Widget build(BuildContext context) {


    final colorScheme = Theme.of(context).colorScheme;
    
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Responsive.padding(7)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                const SizedBox(height: 50),
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Create New Password',
                            style: TextStyle(
                              fontSize: Responsive.fontSize(6),
                              fontWeight: FontWeight.bold,
                              color: colorScheme.onSurface
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: Responsive.screenHeight * 0.02),


                const SizedBox(
                  width: 350,
                  child: Text(
                    'Create your new password and this time write it somewhere safe so you do not forget it again;) ',
                    style: TextStyle(fontSize: 17),
                  ),
                ),

                SizedBox(height: Responsive.screenHeight * 0.04),


                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('New Password', style: TextStyle(fontWeight: FontWeight.bold, color: colorScheme.onSurface, fontSize: Responsive.fontSize(4))),
                  ],
                ),
                SizedBox(height: Responsive.screenHeight * 0.01),

                Form(
             //     key: controller.formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) => controller.validatePassword(value),
                        controller: controller.newPasswordController,
                        decoration: InputDecoration(
                          hintText: '********',
                          prefixIcon: Icon(Icons.lock_open_sharp),
                          hintStyle: TextStyle(color: AppColors.secondary),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor:colorScheme.surface,
                          contentPadding: EdgeInsets.symmetric(vertical: 20),
                        ),
                      ),
                      SizedBox(height: Responsive.screenHeight * 0.02),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Confirm Password', style: TextStyle(fontWeight: FontWeight.bold, color: colorScheme.onSurface, fontSize: Responsive.fontSize(4))),
                        ],
                      ),
                      SizedBox(height: Responsive.screenHeight * 0.01),

                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.text,
                        validator: (value) => controller.validateConfirmPassword(value),
                        controller: controller.confirmPasswordController,
                        decoration: InputDecoration(
                          hintText: '********',
                          prefixIcon: Icon(Icons.lock_open_sharp),
                          hintStyle: TextStyle(color: AppColors.secondary),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor:colorScheme.surface,
                          contentPadding: EdgeInsets.symmetric(vertical: 20),
                        ),
                      ),

                    ],
                  ),
                ),


                SizedBox(height: Responsive.screenHeight * 0.03),


                Divider(
                  color: Colors.grey.shade300,
                  thickness: 1,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: SizedBox(
                    height: 60,
                    width: 350,
                    child: CustomTextButton(
                      onPressed: () {
                       // if (controller.formKey.currentState!.validate()) {
                          SuccessCard(
                            title: 'Password Reset Successful',
                            message: 'We are updating your password and redirecting you to homepage',
                            image: Image.asset('assets/images/logo.png', height: 40, width: 40,),
                          );
                          Get.toNamed('/signIn');
                       // }
                      },
                      foregroundColor: AppColors.white,
                      backgroundColor: AppColors.primary,
                      child: Text('Continue'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
