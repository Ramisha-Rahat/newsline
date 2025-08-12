import 'package:get/get.dart';
import 'package:newsline/domain/viewModel/controller/responsive_navigation_controller.dart';

class ResponsiveNavigationBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ResponsiveNavigationController>(()=>ResponsiveNavigationController());
  }
}