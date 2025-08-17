import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsline/presentation/views/homePage/homeScreen.dart';
import 'package:newsline/presentation/views/homePage/profile_page.dart';
import 'package:newsline/presentation/views/homePage/blog_page.dart';
import 'package:newsline/presentation/views/homePage/searchPage.dart';
import '../../domain/viewModel/controller/responsive_navigation_controller.dart';

class ResponsiveNavigationScreen extends StatelessWidget {
  ResponsiveNavigationScreen({super.key});

  final ResponsiveNavigationController controller = Get.put(ResponsiveNavigationController());

  final List<Widget> pages = [
    HomeScreen(),
    const BlogPage(),
    const SearchPage(),
    const ProfilePage()
  ];

  final List<BottomNavigationBarItem> navItems = const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    BottomNavigationBarItem(icon: Icon(Icons.book), label: "Blog"),
    BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
  ];



  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Obx(() {
      return SafeArea(
        child: Scaffold(
          body: IndexedStack(
            index: controller.indexedStack.value,
            children: pages,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.indexedStack.value,
            onTap: controller.onItemTapped,
            items: navItems,
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: TextStyle(color: colorScheme.primary),
            unselectedLabelStyle: TextStyle(color: Colors.grey),
          ),
        ),
      );
    });
  }
}
