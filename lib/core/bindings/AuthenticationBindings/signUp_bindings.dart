import 'package:get/get.dart';
import 'package:newsline/domain/viewModel/controller/AuthControllers/signUp_controllers.dart';

class SignUpBinding extends Bindings{
  @override
void dependencies() {
 Get.lazyPut<SignUpController>(()=>SignUpController());
}
}