import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsline/domain/viewModel/controller/HomeScreenControllers/homeScreenControllers.dart';
import 'package:newsline/shared/utils/responsive_utils.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeScreenController controller = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "NewsLine",
          style: TextStyle(
            fontSize: Responsive.fontSize(6),
            color: colorScheme.onSurface,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Responsive.padding(6),
            vertical: Responsive.padding(4),
          ),
          child: Column(
            children: [
              SizedBox(
                height: Responsive.height(15),
                width: double.infinity,
                child: GetBuilder<HomeScreenController>(
                  builder: (ctrl) {
                    return Skeletonizer(
                      enabled: ctrl.isLoading,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 6,
                        padding: EdgeInsets.symmetric(
                          horizontal: Responsive.margin(2),
                        ),
                        itemBuilder: (context, index) {
                          return Container(
                            width: Responsive.width(65),
                            margin: EdgeInsets.symmetric(
                              horizontal: Responsive.margin(2),
                            ),
                            decoration: BoxDecoration(
                              color: colorScheme.surface,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    'assets/images/test.jpg',
                                    height: double.infinity,
                                    width: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'hello',
                                          style: TextStyle(
                                            color: colorScheme.onSurface,
                                            fontSize: Responsive.fontSize(4),
                                            fontWeight: FontWeight.bold,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          'hello i am here to write details of it some details',
                                          style: TextStyle(
                                            color: colorScheme.onSurface,
                                            fontSize: Responsive.fontSize(3),
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: Responsive.screenHeight * 0.05),

              SizedBox(
                height: 50,
                child: GetBuilder<HomeScreenController>(
                  builder: (ctrl) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        final isSelected =
                            ctrl.selectedFilter == index;
                        return GestureDetector(
                          onTap: () {
                            ctrl.selectedFilter = index;
                            ctrl.update();
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 6),
                            padding: const EdgeInsets.symmetric(horizontal: 26),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? colorScheme.primary
                                  : Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "Filter $index",
                              style: TextStyle(
                                fontSize: Responsive.fontSize(4),
                                color: isSelected
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),

              SizedBox(height: Responsive.screenHeight * 0.02),

              Expanded(
                child: GetBuilder<HomeScreenController>(
                  builder: (ctrl) {
                    return IndexedStack(
                      index: ctrl.selectedFilter,
                      children: List.generate(
                        6,
                            (filterIndex) {
                          return Skeletonizer(
                            enabled: ctrl.isLoading,
                            child: ListView.builder(
                              itemCount: 6,
                              itemBuilder: (context, index) {
                                return Card(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 6),
                                  child: ListTile(
                                    leading: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        'assets/images/test.jpg',
                                        height: double.infinity,
                                        width: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    title: Text(
                                      "Filter $filterIndex - Item $index",
                                      style: TextStyle(
                                        fontSize: Responsive.fontSize(4),
                                      ),
                                    ),
                                    subtitle: Text(
                                      'bkfh',
                                      style: TextStyle(
                                        fontSize: Responsive.fontSize(2),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
