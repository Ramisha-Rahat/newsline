import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsline/shared/utils/responsive_utils.dart';
import 'package:newsline/widgets/buttons/cutsom_button.dart';
import '../../../data/services/login_api_services.dart';
import '../../../domain/viewModel/controller/AuthControllers/signUp_controllers.dart';
import '../../../shared/constants/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../widgets/cards/success_card.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final controller = Get.find<SignUpController>();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Responsive.padding(7)),
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: Responsive.fontSize(6)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () => Get.back(),
                        icon: Icon(Icons.arrow_back, size: 25),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Create Account',
                              style: TextStyle(
                                fontSize: 30,
                                color: colorScheme.onSurface,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Responsive.height(2)),
                  const SizedBox(
                    width: 350,
                    child: Text(
                      'Join our community and personalize your news experience',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  const SizedBox(height: 10),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Email',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Responsive.fontSize(5))),
                    ],
                  ),
                  SizedBox(height: Responsive.height(1.5)),
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
                    onFieldSubmitted: (_) => FocusScope.of(context)
                        .requestFocus(controller.usernameFocus),
                    decoration: InputDecoration(
                      hintText: 'abc@gmail.com',
                      prefixIcon: Icon(Icons.email),
                      hintStyle: TextStyle(color: AppColors.secondary),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: colorScheme.surface,
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 20),
                    ),
                  ),

                  SizedBox(height: Responsive.height(2)),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Username',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Responsive.fontSize(5))),
                    ],
                  ),
                  SizedBox(height: Responsive.height(1.5)),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    controller: controller.usernameController,
                    focusNode: controller.usernameFocus,
                    onFieldSubmitted: (_) => FocusScope.of(context)
                        .requestFocus(controller.passwordFocus),
                    decoration: InputDecoration(
                      hintText: 'abc',
                      prefixIcon: Icon(Icons.person),
                      hintStyle: TextStyle(color: AppColors.secondary),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: colorScheme.surface,
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 20),
                    ),
                  ),

                  SizedBox(height: 2,),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Password',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Responsive.fontSize(6))),
                    ],
                  ),
                  SizedBox(height: Responsive.height(1.5)),
                  Obx(() => TextFormField(
                    obscureText: controller.isObscurePassword.value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      } else if (value.length <= 6) {
                        return 'Password must be longer than 6 characters';
                      }
                      return null;
                    },
                    controller: controller.passwordController,
                    focusNode: controller.passwordFocus,
                    decoration: InputDecoration(
                      hintText: '*********',
                      prefixIcon: Icon(Icons.lock_open_sharp),
                      suffixIcon: IconButton(
                        icon: Icon(controller.isObscurePassword.value
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () =>
                            controller.togglePasswordVisibility(),
                      ),
                      hintStyle: TextStyle(color: AppColors.secondary),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: colorScheme.surface,
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 20),
                    ),
                  )),

                  SizedBox(height: Responsive.height(2)),

                  // Confirm Password
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Confirm Password',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Responsive.fontSize(6))),
                    ],
                  ),
                  SizedBox(height: Responsive.height(1.5)),
                  Obx(() => TextFormField(
                    obscureText:
                    controller.isObscureConfirmPassword.value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm password';
                      } else if (value !=
                          controller.passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                    controller: controller.confirmPasswordController,
                    focusNode: controller.confirmPasswordFocus,
                    decoration: InputDecoration(
                      hintText: '*********',
                      prefixIcon: Icon(Icons.lock_open_sharp),
                      suffixIcon: IconButton(
                        icon: Icon(controller
                            .isObscureConfirmPassword.value
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () =>
                            controller.toggleConfirmPasswordVisibility(),
                      ),
                      hintStyle: TextStyle(color: AppColors.secondary),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: colorScheme.surface,
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 20),
                    ),
                  )),

                  // Terms & conditions checkbox
                  Row(
                    children: [
                      Obx(() => Checkbox(
                        checkColor: AppColors.secondary,
                        value: controller.isChecked.value,
                        onChanged: controller.checkBoxButton,
                      )),
                      RichText(
                        text: TextSpan(
                          text: "I agree to all ",
                          style: TextStyle(
                              fontSize: Responsive.fontSize(4),
                              color: colorScheme.onSurface),
                          children: [
                            TextSpan(
                              text: 'Terms and Conditions',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: Responsive.height(3)),


                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: SizedBox(
                      height: 60,
                      width: 350,
                      child: CustomTextButton(
                          onPressed: () async {
                            if (controller.formKey.currentState!.validate()) {
                              final api = ApiService();

                              String email = controller.emailController.text.trim();
                              String username = controller.usernameController.text.trim();
                              String password = controller.passwordController.text.trim();
                              String confirm_password = controller.confirmPasswordController.text.trim();

                              try {
                                final token = await api.signUp(username, email, password, confirm_password);
                                if (token != null) {
                                  final prefs = await SharedPreferences.getInstance();
                                  await prefs.setString("access_token", token);
                                  Get.dialog(
                                    SuccessCard(
                                      title: 'Sign Up Successful',
                                      message: 'Now you can log in with your credentials.',
                                      image: Image.asset('assets/images/logo.png', height: 40, width: 40),
                                    ),
                                  );
                                  Get.toNamed('/onBoardingScreen');
                                }
                              } catch (e) {
                                Get.snackbar(
                                  'SignUp Failed',
                                  e.toString().replaceAll("Exception: ", ""),
                                  backgroundColor: Colors.red,
                                  colorText: Colors.white,
                                );
                              }
                          }
                        },
                        foregroundColor: AppColors.white,
                        backgroundColor: AppColors.primary,
                        child: const Text('Sign Up'),
                      ),


                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
