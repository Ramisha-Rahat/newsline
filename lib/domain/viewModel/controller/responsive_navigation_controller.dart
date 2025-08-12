import 'package:get/get.dart';

class ResponsiveNavigationController extends GetxController {
  RxInt indexedStack = 0.obs;

  void onItemTapped(int index) {
    indexedStack.value = index;
  }

  // The full list of items to search from
  final items = [
    "Apple",
    "Banana",
    "Orange",
    "Watermelon",
    "Pineapple",
    "Strawberry",
    "Grapes",
    "Mango",
  ];

  // The filtered list shown in UI
  var filteredItems = <String>[].obs;

  // The search query
  var searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize filteredItems with full list
    filteredItems.value = items;

    // Whenever searchQuery changes, filter the list
    ever(searchQuery, (_) => filterItems());
  }

  void filterItems() {
    if (searchQuery.value.isEmpty) {
      filteredItems.value = items;
    } else {
      filteredItems.value = items
          .where(
            (item) =>
                item.toLowerCase().contains(searchQuery.value.toLowerCase()),
          )
          .toList();
    }
  }
}
