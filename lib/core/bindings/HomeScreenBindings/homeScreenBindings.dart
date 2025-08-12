import 'package:get/get.dart';

import '../../../domain/viewModel/controller/HomeScreenControllers/homeScreenControllers.dart';

class HomeScreenBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<HomeScreenController>(()=> HomeScreenController());
  }

}