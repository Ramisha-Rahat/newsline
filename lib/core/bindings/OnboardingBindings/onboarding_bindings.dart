import 'package:get/get.dart';

import '../../../domain/viewModel/controller/OnboardingControllers/onboarding_controller.dart';

class OnboardingBindings extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut<OnboardingController>(() => OnboardingController());
  }

}