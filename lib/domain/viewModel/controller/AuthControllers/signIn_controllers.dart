import 'package:get/get.dart';
import 'package:flutter/material.dart';
class SignInController extends GetxController{

final formKey=GlobalKey<FormState>();

  final emailController=TextEditingController();
  final passwordController=TextEditingController();

 //final gmailRegex = RegExp(r'^[\w-\.]+@gmail\.com$');


  final FocusNode emailFocus=FocusNode();
  final FocusNode passwordFocus=FocusNode();

  RxBool isObscureText=true.obs;


  void togglePasswordVisibility() {
    isObscureText.value = !isObscureText.value;
  }


  RxBool isChecked = false.obs;

  void checkBoxButton(bool? value) {
    isChecked.value = value ?? false;
  }


  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}