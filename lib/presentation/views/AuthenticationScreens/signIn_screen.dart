import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/gestures.dart';
import 'package:newsline/widgets/cards/success_card.dart';

import '../../../domain/viewModel/controller/AuthControllers/signIn_controllers.dart';
import '../../../shared/constants/app_colors.dart';
import '../../../widgets/buttons/cutsom_button.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final controller = Get.find<SignInController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
 resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [Icon(Icons.arrow_back, size: 25)],
                ),
                const SizedBox(height: 50),
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Welcome Back',
                            style: TextStyle(
                              fontSize: 35,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: ' 👩‍💻 ',
                            style: TextStyle(fontSize: 35),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        
                const SizedBox(height: 30),
        
                const SizedBox(
                  width: 350,
                  child: Text(
                    'Please enter your email and password to sign in to your account.',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
        
                const SizedBox(height: 30),
        
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Email', style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 10),
        
                Form(
                  key: controller.formKey,
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
                        ).requestFocus(controller.passwordFocus),
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
                          fillColor: Colors.grey.shade100,
                          contentPadding: EdgeInsets.symmetric(vertical: 20),
                        ),
                      ),
        
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Password',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
        
                      Obx(
                        () => TextFormField(
                          obscureText: controller.isObscureText.value,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            } else if (value.length <= 6) {
                              return 'Password must be strong and longer than 6';
                            }
                            return null;
                          },
                          controller: controller.passwordController,
                          focusNode: controller.passwordFocus,
                          onFieldSubmitted: (_) =>
                              FocusScope.of(context).requestFocus(),
                          decoration: InputDecoration(
                            hintText: '*********',
                            prefixIcon: Icon(Icons.lock_open_sharp),
                            suffixIcon: IconButton(
                              icon: Icon(
                                controller.isObscureText.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () {
                                controller.togglePasswordVisibility();
                              },
                            ),
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
                            fillColor: Colors.grey.shade100,
                            contentPadding: EdgeInsets.symmetric(vertical: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Center(
                          child: Obx(
                            () => Checkbox(
                              checkColor: AppColors.secondary,
                              value: controller.isChecked.value,
                              onChanged: controller.checkBoxButton,
                            ),
                          ),
                        ),
                        const Text(
                          'Remember me',
                          style: TextStyle(fontSize: 15, color: AppColors.black),
                        ),
                      ],
                    ),
                    // SizedBox(width: 70,),
                     InkWell(
                      onTap: () {
                        Get.toNamed('/resetPasswordOnboardingScreens');
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontSize: 15,
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                     ),
                  ],
                ),
        
                const SizedBox(height: 20),
         
         Divider(
                  color: Colors.grey.shade300,
                  thickness: 1,
                ),
        
                RichText(
                  text: TextSpan(
                    text: "Create an Account?",
                    style: TextStyle(fontSize: 15, color: AppColors.black),
                    children: [
                      TextSpan(
                        text: ' Sign Up',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.toNamed('/home');
                          },
                      ),
                    ],
                  ),
                ),
        
                const SizedBox(height: 70),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: SizedBox(
                    height: 60,
                    width: 350,
                    child: CustomTextButton(
                      onPressed: () {
                        
                        if (controller.formKey.currentState!.validate()) {
                          Get.dialog(
                            SuccessCard(
                              title: 'Sign In Successful',
                              message: 'Please wait we are signing you in.',
                              image: Image.asset('assets/images/logo.png', height: 40, width: 40),
                            ),
                          );
                          Get.toNamed('/home');
                        }
                      },
                      foregroundColor: AppColors.white,
                      backgroundColor: AppColors.primary,
                      child: Text('Sign In',
                      
                      ),
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
