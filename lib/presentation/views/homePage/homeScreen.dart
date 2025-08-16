import 'package:flutter/material.dart';
import 'package:newsline/shared/utils/responsive_utils.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedFilter = 0;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

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
                child: Skeletonizer(
                  enabled: _isLoading,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                ),
              ),

              SizedBox(height: Responsive.screenHeight * 0.05),

              SizedBox(
                height: 50,
                child: ListView.builder(

                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    final isSelected = _selectedFilter == index;
                    return GestureDetector(
                      onTap: () {
                        setState(() => _selectedFilter = index);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 26),
                        margin: const EdgeInsets.symmetric(horizontal: 6),
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
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: Responsive.screenHeight * 0.02),
              Expanded(
                child: IndexedStack(
                  index: _selectedFilter,
                  children: List.generate(6, (filterIndex) {
                    return Skeletonizer(
                      enabled: _isLoading,
                      child: ListView.builder(
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return Card(
                            margin: const EdgeInsets.symmetric(vertical: 6),
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
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:url_launcher/url_launcher.dart';
// import '../../../domain/viewModel/controller/HomeScreenControllers/homeScreenControllers.dart';
// import '../../../shared/utils/responsive_utils.dart';
//
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final HomeScreenController controller = Get.put(HomeScreenController());
//     final colorScheme = Theme.of(context).colorScheme;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("NewsLine", style: TextStyle(fontSize: Responsive.fontSize(3))),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           // ✅ Filters
//           SizedBox(
//             height: 50,
//             child: Obx(() => ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: controller.filters.length,
//               itemBuilder: (context, index) {
//                 final isSelected = controller.selectedFilter.value == index;
//                 return GestureDetector(
//                   onTap: () => controller.changeFilter(index),
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     margin: const EdgeInsets.symmetric(horizontal: 6),
//                     decoration: BoxDecoration(
//                       color: isSelected ? colorScheme.primary : Colors.grey.shade300,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     alignment: Alignment.center,
//                     child: Text(
//                       controller.filters[index],
//                       style: TextStyle(
//                         color: isSelected ? Colors.white : Colors.black,
//                         fontSize: Responsive.fontSize(3),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             )),
//           ),
//
//           const SizedBox(height: 12),
//
//           // ✅ News List
//           Expanded(
//             child: Obx(() {
//               if (controller.isLoading.value && controller.articles.isEmpty) {
//                 return const Center(child: CircularProgressIndicator());
//               }
//
//               if (controller.articles.isEmpty) {
//                 return Center(child: Text("No news available",
//                     style: TextStyle(fontSize: Responsive.fontSize(3))));
//               }
//
//               return ListView.builder(
//                 itemCount: controller.articles.length + 1,
//                 itemBuilder: (context, index) {
//                   if (index < controller.articles.length) {
//                     final article = controller.articles[index];
//                     return Card(
//                       margin: const EdgeInsets.all(8),
//                       child: ListTile(
//                         leading: article["urlToImage"] != null
//                             ? Image.network(article["urlToImage"],
//                             width: 100, fit: BoxFit.fill)
//                             : const Icon(Icons.image_not_supported, size: 40),
//                         title: Text(article["title"] ?? "No title",
//                             style: TextStyle(fontSize: Responsive.fontSize(5))),
//                         subtitle: Text(article["description"] ?? "",
//                             style: TextStyle(fontSize: Responsive.fontSize(3))),
//                         onTap: () async {
//                           final url = article["url"];
//                           if (await canLaunchUrl(Uri.parse(url))) {
//                             await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
//                           } else {
//                             print("Could not launch $url");
//                           }
//                         },
//                       ),
//                     );
//                   } else {
//                     // ✅ Load More Button
//                     if (controller.hasMore.value) {
//                       return Center(
//                         child: ElevatedButton(
//                           onPressed: () => controller.fetchNews(loadMore: true),
//                           child: const Text("Load More"),
//                         ),
//                       );
//                     } else {
//                       return const Center(
//                         child: Padding(
//                           padding: EdgeInsets.all(12.0),
//                           child: Text("No more news"),
//                         ),
//                       );
//                     }
//                   }
//                 },
//               );
//             }),
//           ),
//         ],
//       ),
//     );
//   }
// }
