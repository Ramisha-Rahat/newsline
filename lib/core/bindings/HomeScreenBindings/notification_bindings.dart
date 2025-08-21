import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get.dart';
import 'package:newsline/domain/viewModel/controller/HomeScreenControllers/notification_controllers.dart';

class NotificationBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<NotificationControllers>(()=>NotificationControllers());
  }
}