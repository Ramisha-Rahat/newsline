import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsline/shared/utils/responsive_utils.dart';
import 'package:newsline/widgets/buttons/cutsom_button.dart';
import '../../../domain/viewModel/controller/AuthControllers/signUp_controllers.dart';
import '../../../shared/constants/app_colors.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final controller = Get.find<SignUpController>();

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
             SizedBox(height: Responsive.fontSize(6)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(onPressed: (){
                      Get.offAllNamed('/home');
                    },
                        icon: Icon(Icons.arrow_back, size: 25))
                    ],
                ),
                SizedBox(height: Responsive.fontSize(12)),
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
                          TextSpan(
                            text: ' 👩‍💻 ',
                            style: TextStyle(fontSize: Responsive.fontSize(6)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        
             SizedBox(height:Responsive.height(3) ),
        
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
                    Text('Email', style:
                    TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Responsive.fontSize(6))
                    ),
                  ],
                ),
              SizedBox(height: Responsive.height(2)),
        
                Form(
          //        key: controller.formKey,
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
                          fillColor: colorScheme.surface,
                          contentPadding: EdgeInsets.symmetric(vertical: 20),
                        ),
                      ),
        
                     SizedBox(height: Responsive.height(2)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Password',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: Responsive.fontSize(6)),
                          ),
                        ],
                      ),
                       SizedBox(height:Responsive.height(2) ),
        
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
                            fillColor: colorScheme.surface,
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
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        text: "I agree to all",
                        style: TextStyle(fontSize: Responsive.fontSize(4), color: colorScheme.onSurface),
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
        
               SizedBox(height: Responsive.height(3)),
                 
         Divider(
                  color: Colors.grey.shade300,
                  thickness: 1,
                ),
        
                RichText(
                  text: TextSpan(
                    text: "Already have an Account?",
                    style: TextStyle(fontSize: 15,color: colorScheme.onSurface),
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
        
              SizedBox(height:Responsive.height(5)),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: SizedBox(
                    height: 60,
                    width: 350,
                    child: CustomTextButton(
                      onPressed: () {
                        // if (controller.formKey.currentState!.validate()) {
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     const SnackBar(content: Text('Your data is been saving')),
                        //   );
                          Get.toNamed('/onboardingScreen');
                      //  }
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
