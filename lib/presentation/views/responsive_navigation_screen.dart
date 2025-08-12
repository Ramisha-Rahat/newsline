import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsline/presentation/views/homePage/homeScreen.dart';
import 'package:newsline/presentation/views/homePage/profile_page.dart';
import 'package:newsline/presentation/views/homePage/saved_page.dart';
import 'package:newsline/presentation/views/homePage/searchPage.dart';
import 'package:newsline/shared/Theme/color_scheme.dart';
import '../../domain/viewModel/controller/responsive_navigation_controller.dart';

class ResponsiveNavigationScreen extends StatelessWidget {
  ResponsiveNavigationScreen({super.key});

  final ResponsiveNavigationController controller = Get.put(ResponsiveNavigationController());

  final List<Widget> pages = const [
    HomeScreen(),
    SearchPage(),
    SavedPage(),
    ProfilePage()
  ];

  final List<BottomNavigationBarItem> navItems = const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
    BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: "Saved"),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
  ];




  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: IndexedStack(
            index: controller.indexedStack.value,
            children: pages,
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            currentIndex: controller.indexedStack.value,
            onTap: controller.onItemTapped,
            items: navItems,
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: TextStyle(color: AppColorScheme.lightColorScheme.primary),
            unselectedLabelStyle: TextStyle(color: Colors.grey),
          ),
        ),
      );
    });
  }
}
