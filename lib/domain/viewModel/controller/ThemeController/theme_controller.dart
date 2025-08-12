import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ThemeController extends GetxController{

  final isDarkMode = false.obs;
  ThemeMode get theme => isDarkMode.value ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }


}