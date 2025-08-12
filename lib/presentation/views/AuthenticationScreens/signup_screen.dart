import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsline/widgets/buttons/cutsom_button.dart';

import '../../../domain/viewModel/controller/AuthControllers/signUp_controllers.dart';
import '../../../shared/constants/app_colors.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final controller = Get.find<SignUpController>();

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
                            text: 'Create Account',
                            style: TextStyle(
                              fontSize: 30,
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
                    'Join our community and personalize your news experience',
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
                    RichText(
                      text: TextSpan(
                        text: "I agree to all",
                        style: TextStyle(fontSize: 15, color: AppColors.black),
                        children: [
                          WidgetSpan(child: SizedBox(width: 8)),
                          TextSpan(
                            text: 'Terms and Conditions',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                //   Get.toNamed('/signUp');
                              },
                          ),
                        ],
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
                    text: "Already have an Account?",
                    style: TextStyle(fontSize: 15, color: AppColors.black),
                    children: [
                      TextSpan(
                        text: ' Sign In',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.toNamed('/signIn');
                          },
                      ),
                    ],
                  ),
                ),
        
                const SizedBox(height: 100),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: SizedBox(
                    height: 60,
                    width: 350,
                    child: CustomTextButton(
                      onPressed: () {
                        if (controller.formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Your data is been saving')),
                          );
                          Get.toNamed('/countrySelectionScreen');
                        }
                      },
                      foregroundColor: AppColors.white,
                      backgroundColor: AppColors.primary,
                      child: Text('Sign Up'),
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
