import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsline/domain/viewModel/controller/responsive_navigation_controller.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {

    final controller=Get.find<ResponsiveNavigationController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Example'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              onChanged: (value) => controller.searchQuery.value = value,
              decoration: const InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.filteredItems.isEmpty) {
                return const Center(child: Text('No results found.'));
              }
              return ListView.builder(
                itemCount: controller.filteredItems.length,
                itemBuilder: (_, index) {
                  final item = controller.filteredItems[index];
                  return ListTile(
                    title: Text(item),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
