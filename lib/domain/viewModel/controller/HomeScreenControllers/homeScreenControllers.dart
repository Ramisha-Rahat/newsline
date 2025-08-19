import 'package:get/get.dart';

class HomeScreenController extends GetxController {
 bool isLoading = true;
 int selectedFilter = 0;

 @override
 void onInit() {
  super.onInit();
  _loadData();
 }

 void _loadData() async {
  await Future.delayed(const Duration(seconds: 4));
  isLoading = false;
  update();
 }

 void changeFilter(int index) {
  selectedFilter = index;
  update();
 }
}
