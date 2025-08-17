import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:newsline/core/routes/route_names.dart';
import 'package:newsline/shared/utils/responsive_utils.dart';
import 'package:newsline/widgets/cards/success_card.dart';
import '../../../data/services/login_api_services.dart';
import '../../../domain/viewModel/controller/AuthControllers/signIn_controllers.dart';
import '../../../shared/constants/app_colors.dart';
import '../../../widgets/buttons/cutsom_button.dart';

class SignInScreen extends GetView<SignInController> {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Responsive.padding(7)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: Responsive.fontSize(6)),

                // Back Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(Icons.arrow_back, size: 25),
                    ),
                  ],
                ),

                SizedBox(height: Responsive.fontSize(12)),

                // Welcome Text
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Welcome Back',
                            style: TextStyle(
                              fontSize: 35,
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

                SizedBox(height: Responsive.height(3)),

                const SizedBox(
                  width: 350,
                  child: Text(
                    'Please enter your email and password to sign in to your account.',
                    style: TextStyle(fontSize: 17),
                  ),
                ),

                const SizedBox(height: 30),

                // Email Label
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Email',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Responsive.fontSize(6),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Responsive.height(2)),

                // Form Start
                Form(
                  key: controller.signInformKey,
                  child: Column(
                    children: [
                      // Email Field
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.emailAddress,
                        controller: controller.emailController,
                        focusNode: controller.emailFocus,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          } else if (!value.contains("@") || !value.contains(".com")) {
                            return 'Please write correct gmail';
                          }
                          return null;
                        },
                        onFieldSubmitted: (_) =>
                            FocusScope.of(context).requestFocus(controller.passwordFocus),
                        decoration: InputDecoration(
                          hintText: 'abc@gmail.com',
                          prefixIcon: const Icon(Icons.email),
                          hintStyle: TextStyle(color: AppColors.secondary),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: colorScheme.surface,
                          contentPadding: const EdgeInsets.symmetric(vertical: 20),
                        ),
                      ),

                      const SizedBox(height: 10),

                      // Password Label
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Password',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Responsive.fontSize(6),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: Responsive.height(2)),

                      // Password Field
                      Obx(
                            () => TextFormField(
                          obscureText: controller.isObscureText.value,
                          controller: controller.passwordController,
                          focusNode: controller.passwordFocus,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            } else if (value.length <= 6) {
                              return 'Password must be longer than 6';
                            }
                            return null;
                          },
                          onFieldSubmitted: (_) =>
                              FocusScope.of(context).requestFocus(),
                          decoration: InputDecoration(
                            hintText: '*********',
                            prefixIcon: const Icon(Icons.lock_open_sharp),
                            suffixIcon: IconButton(
                              icon: Icon(
                                controller.isObscureText.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: controller.togglePasswordVisibility,
                            ),
                            hintStyle: TextStyle(color: AppColors.secondary),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: colorScheme.surface,
                            contentPadding: const EdgeInsets.symmetric(vertical: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Remember Me + Forgot Password
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
                        Text(
                          'Remember me',
                          style: TextStyle(
                            fontSize: Responsive.fontSize(4),
                            color: colorScheme.onSurface,
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () => Get.toNamed('/resetPasswordOnboardingScreens'),
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

                Divider(color: Colors.grey.shade300, thickness: 1),

                // Sign Up Link
                RichText(
                  text: TextSpan(
                    text: "Create an Account? ",
                    style: TextStyle(fontSize: 15, color: colorScheme.onSurface),
                    children: [
                      TextSpan(
                        text: 'Sign Up',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.toNamed('/signUp'),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 70),

                // Sign In Button
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: SizedBox(
                    height: 60,
                    width: 350,
                    child: CustomTextButton(
                      onPressed: () async {
                        final formState = controller.signInformKey.currentState;
                        if (formState != null && formState.validate()) {
                          final api = ApiService();
                          String email = controller.emailController.text.trim();
                          String password = controller.passwordController.text.trim();

                          try {
                            String? token = await api.login(email, password);

                            if (token != null) {
                              Get.dialog(
                                SuccessCard(
                                  title: 'Sign In Successful',
                                  message: 'Please wait we are signing you in.',
                                  image: Image.asset(
                                    'assets/images/logo.png',
                                    height: 40,
                                    width: 40,
                                  ),
                                ),
                              );

                              await api.getRoot(token);
                              Get.offAllNamed(RouteNames.homePage);
                            } else {
                              Get.snackbar(
                                'Login Failed',
                                'Invalid email or password.',
                                backgroundColor: Colors.red,
                                colorText: Colors.white,
                              );
                            }
                          } catch (e) {
                            Get.snackbar(
                              'Login Failed',
                              e.toString().replaceAll("Exception: ", ""),
                              backgroundColor: Colors.red,
                              colorText: Colors.white,
                            );
                          }
                        } else {
                          Get.snackbar(
                            'Error',
                            'Please fill in the form correctly.',
                            backgroundColor: Colors.orange,
                            colorText: Colors.white,
                          );
                        }
                      },
                      foregroundColor: AppColors.white,
                      backgroundColor: AppColors.primary,
                      child: const Text('Sign In'),
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
