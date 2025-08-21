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
        title: Text(
          "NEWSLINE",
          style: TextStyle(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.bold,
            fontSize: Responsive.fontSize(5),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              controller.refreshNews();
            },
            icon: Icon(
              Icons.refresh,
              color: colorScheme.onSurface,
              size: Responsive.fontSize(6),
            ),
          ),
          SizedBox(width: Responsive.padding(4)),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Responsive.padding(4),
            vertical: Responsive.padding(2),
          ),
          child: Column(
            children: [
              SizedBox(
                height: Responsive.height(18),
                width: double.infinity,
                child: GetBuilder<HomeScreenController>(
                  builder: (ctrl) {
                    return Skeletonizer(
                      enabled: ctrl.isLoading,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: ctrl.topNews.length,
                        itemBuilder: (context, index) {
                          final article = ctrl.topNews[index];
                          return Container(
                            width: Responsive.width(65),
                            margin: EdgeInsets.symmetric(
                                horizontal: Responsive.margin(2)),
                            decoration: BoxDecoration(
                              color: colorScheme.surface,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 6,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(12)),
                                  child: Image.network(
                                    article["urlToImage"] ?? "",
                                    height: Responsive.height(10),
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    errorBuilder: (_, __, ___) =>
                                        Container(color: Colors.grey.shade300),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    article["title"] ?? "No title",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: colorScheme.onSurface,
                                      fontWeight: FontWeight.bold,
                                      fontSize: Responsive.fontSize(3.5),
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

              SizedBox(height: Responsive.screenHeight * 0.03),

              SizedBox(
                height: 50,
                child: GetBuilder<HomeScreenController>(
                  builder: (ctrl) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: ctrl.categories.length,
                      itemBuilder: (context, index) {
                        final isSelected = ctrl.selectedFilter == index;
                        final category = ctrl.categories[index];
                        return GestureDetector(
                          onTap: () {
                            ctrl.selectedFilter = index;
                            ctrl.fetchCategoryNews(category);
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 6),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 8),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? colorScheme.primary
                                  : Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              category,
                              style: TextStyle(
                                fontSize: Responsive.fontSize(3.5),
                                fontWeight: FontWeight.w600,
                                color: isSelected
                                    ? Colors.white
                                    : Colors.black87,
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
                    return Skeletonizer(
                      enabled: ctrl.isLoading,
                      child: ListView.builder(
                        itemCount: ctrl.categoryNews.length,
                        itemBuilder: (context, index) {
                          final article = ctrl.categoryNews[index];
                          return Card(
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: ListTile(
                              contentPadding: EdgeInsets.all(8),
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  article["urlToImage"] ?? "",
                                  width: 90,
                                  fit: BoxFit.cover,
                                  errorBuilder: (_, __, ___) =>
                                      Container(width: 90, color: Colors.grey),
                                ),
                              ),
                              title: Text(
                                article["title"] ?? "No title",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: Responsive.fontSize(3.5),
                                  fontWeight: FontWeight.w600,
                                  color: colorScheme.onSurface,
                                ),
                              ),
                              subtitle: Text(
                                article["description"] ?? "",
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: Responsive.fontSize(3),
                                  color: colorScheme.onSurface.withOpacity(0.7),
                                ),
                              ),
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






// child: ListView.builder(
//   scrollDirection: Axis.horizontal,
//   itemCount: 6,
//   padding: EdgeInsets.symmetric(
//     horizontal: Responsive.margin(2),
//   ),
//   itemBuilder: (context, index) {
//     return Container(
//       width: Responsive.width(65),
//       margin: EdgeInsets.symmetric(
//         horizontal: Responsive.margin(2),
//       ),
//       decoration: BoxDecoration(
//         color: colorScheme.surface,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(10),
//             child: Image.asset(
//               'assets/images/test.jpg',
//               height: double.infinity,
//               width: 100,
//               fit: BoxFit.cover,
//             ),
//           ),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 crossAxisAlignment:
//                 CrossAxisAlignment.start,
//                 mainAxisAlignment:
//                 MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'hello',
//                     style: TextStyle(
//                       color: colorScheme.onSurface,
//                       fontSize: Responsive.fontSize(4),
//                       fontWeight: FontWeight.bold,
//                     ),
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   SizedBox(height: 4),
//                   Text(
//                     'hello i am here to write details of it some details',
//                     style: TextStyle(
//                       color: colorScheme.onSurface,
//                       fontSize: Responsive.fontSize(3),
//                     ),
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   },
// ),






// child: ListView.builder(
//   itemCount: 6,
//   itemBuilder: (context, index) {
//     return Card(
//       margin: const EdgeInsets.symmetric(
//           vertical: 6),
//       child: ListTile(
//         leading: ClipRRect(
//           borderRadius: BorderRadius.circular(10),
//           child: Image.asset(
//             'assets/images/test.jpg',
//             height: double.infinity,
//             width: 100,
//             fit: BoxFit.cover,
//           ),
//         ),
//         title: Text(
//           "Filter $filterIndex - Item $index",
//           style: TextStyle(
//             fontSize: Responsive.fontSize(4),
//           ),
//         ),
//         subtitle: Text(
//           'bkfh',
//           style: TextStyle(
//             fontSize: Responsive.fontSize(2),
//           ),
//         ),
//       ),
//     );
//   },
// ),