import 'package:get/get.dart';
import 'package:newsline/domain/viewModel/controller/AuthControllers/forgot_password_controller.dart';

class ForgotPasswordBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordController>(()=>ForgotPasswordController());
  }
}