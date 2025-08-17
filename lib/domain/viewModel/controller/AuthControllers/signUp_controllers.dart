import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final usernameController=TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final FocusNode emailFocus = FocusNode();
  final FocusNode usernameFocus=FocusNode();
  final FocusNode passwordFocus = FocusNode();
  final FocusNode confirmPasswordFocus = FocusNode();

  RxBool isObscurePassword = true.obs;
  RxBool isObscureConfirmPassword = true.obs;

  RxBool isChecked = false.obs;

  void togglePasswordVisibility() {
    isObscurePassword.value = !isObscurePassword.value;
  }

  void toggleConfirmPasswordVisibility() {
    isObscureConfirmPassword.value = !isObscureConfirmPassword.value;
  }

  void checkBoxButton(bool? value) {
    isChecked.value = value ?? false;
  }

  @override
  void dispose() {
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}