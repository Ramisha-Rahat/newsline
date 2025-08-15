import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:newsline/domain/viewModel/controller/AuthControllers/forgot_password_controller.dart';
import 'package:newsline/shared/utils/responsive_utils.dart';

import '../../../../shared/constants/app_colors.dart';
import '../../../../widgets/buttons/cutsom_button.dart';
class ForgotPassword extends StatelessWidget {
  final controller = Get.find<ForgotPasswordController>();

  ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Responsive.padding(7)), child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Reset Your Password',
                            style: TextStyle(
                              fontSize: 25,
                              color: colorScheme.onSurface,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: ' 👩‍💻 ',
                            style: TextStyle(fontSize: Responsive.fontSize(6)),
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
                    'Please enter your  email address and we will send you otp.',
                    style: TextStyle(fontSize: 17),
                  ),
                ),

                SizedBox(height: Responsive.screenHeight * 0.02),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Email',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: Responsive.fontSize(6)),
                    ),
                  ],
                ),
                SizedBox(height: Responsive.screenHeight * 0.02),

                Form(
                 // key: controller.formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          } else if (!value.contains("@") ||
                              (!value.contains(".com"))) {
                            return 'Please write correct gmail';
                          }
                          return null;
                        },
                        controller: controller.emailController,
                        focusNode: controller.emailFocus,
                        onFieldSubmitted: (_) => FocusScope.of(
                          context,
                        ).requestFocus(controller.emailFocus),
                        decoration: InputDecoration(
                          hintText: 'abc@gmail.com',
                          prefixIcon: Icon(Icons.email),
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
                          fillColor: colorScheme.surface,
                          contentPadding: EdgeInsets.symmetric(vertical: 20),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: Responsive.screenHeight * 0.03),

                Divider(color: Colors.grey.shade300, thickness: 1),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: SizedBox(
                    height: 60,
                    width: 350,
                    child: CustomTextButton(
                      onPressed: () {
                        // if (controller.formKey.currentState!.validate()) {
                          controller.sendOtpToEmail();
                          controller.pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                      //  }
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
