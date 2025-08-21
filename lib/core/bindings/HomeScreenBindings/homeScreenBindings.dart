import 'package:get/get.dart';
import 'package:newsline/domain/viewModel/controller/HomeScreenControllers/blog_controller.dart';
import '../../../domain/viewModel/controller/HomeScreenControllers/homeScreenControllers.dart';
import '../../../domain/viewModel/controller/HomeScreenControllers/profile_controller.dart';

class HomeScreenBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<HomeScreenController>(()=> HomeScreenController());
    Get.lazyPut<ProfileController>(()=>ProfileController());
    Get.lazyPut<BlogController>(()=>BlogController());
  }

}