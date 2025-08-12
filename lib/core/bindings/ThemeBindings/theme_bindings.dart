import 'package:get/get.dart';
import '../../../domain/viewModel/controller/ThemeController/theme_controller.dart';

class ThemeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ThemeController>(() => ThemeController());
  }
}