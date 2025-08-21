import 'package:get/get.dart';
import 'package:newsline/domain/viewModel/controller/HomeScreenControllers/edit_profile_controller.dart';
import 'package:newsline/domain/viewModel/controller/HomeScreenControllers/profile_controller.dart';

class ProfileScreenBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<EditProfileController>(()=>EditProfileController());
  }
}