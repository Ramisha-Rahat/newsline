import 'package:get/get.dart';

import '../../../domain/viewModel/controller/AuthControllers/signIn_controllers.dart';

class SignInBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(() => SignInController());
  }
}