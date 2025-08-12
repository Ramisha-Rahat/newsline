import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  // PageView control
  final pageController = PageController();
  final currentPage = 0.obs;

  // Progress bar
  double get progress => (currentPage.value + 1) / 3;

  void updatePage(int page) {
    currentPage.value = page;
  }

  // Step 1: Email entry
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final FocusNode emailFocus = FocusNode();

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your email';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  void onContinueFromEmailStep() {
    if (formKey.currentState!.validate()) {
      sendOtpToEmail(); // Simulated backend call
      nextPage();
    }
  }

  void sendOtpToEmail() {
    final email = emailController.text.trim();
    // You can call your backend here.
    Get.snackbar('OTP Sent', 'We’ve sent an OTP to $email');
  }

  // Step 2: OTP verification secreen
  final otpDigits = List.generate(4, (_) => ''.obs);
  final RxBool isOtpValid = true.obs;

  String get fullOtp => otpDigits.map((d) => d.value).join();

  void verifyOtp() {
    FocusManager.instance.primaryFocus?.unfocus();

    if (fullOtp == '1234') {
      isOtpValid.value = true;
      nextPage();
    } else {
      isOtpValid.value = false;
      Get.snackbar('Error', 'Invalid OTP');
    }
  }


  // Step 3: New password
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final newPasswordFormKey = GlobalKey<FormState>();

  String? validatePassword(String? value) {
    if (value == null || value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value != newPasswordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  void resetPassword() {
    if (newPasswordFormKey.currentState!.validate()) {
      // Call API to reset password here
      Get.snackbar('Success', 'Your password has been reset');
      // Optionally pop or navigate to login screen
    }
  }

  // Page control
  void nextPage() {
    pageController.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void previousPage() {
    pageController.previousPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  // Cleanup
  @override
  void onClose() {
    emailController.dispose();
    emailFocus.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    pageController.dispose();
    super.onClose();
  }
}
