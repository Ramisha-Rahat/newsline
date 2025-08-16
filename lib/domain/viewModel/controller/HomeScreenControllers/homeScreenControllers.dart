 import 'package:get/get.dart';
// import '../../../../data/services/news_api_services.dart';
//
 class HomeScreenController extends GetxController {
 }

//   final NewsService _newsService = NewsService();
//
//   var isLoading = false.obs;
//   var selectedFilter = 0.obs;
//   var articles = <dynamic>[].obs;
//   var currentPage = 1.obs;
//   var hasMore = true.obs;
//
//   var filters = ["All", "Sports", "Tech", "Health"].obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//     fetchNews(); // load first batch
//   }
//
//   Future<void> fetchNews({bool loadMore = false}) async {
//     if (isLoading.value) return;
//
//     if (!loadMore) {
//       currentPage.value = 1;
//       articles.clear();
//       hasMore.value = true;
//     }
//
//     isLoading.value = true;
//     try {
//       final category = filters[selectedFilter.value];
//       final data = await _newsService.fetchNewsByCategory(category, page: currentPage.value);
//
//       if (data.isEmpty) {
//         hasMore.value = false;
//       } else {
//         articles.addAll(data);
//         currentPage.value++;
//       }
//     } catch (e) {
//       print("Error fetching news: $e");
//     } finally {
//       isLoading.value = false;
//     }
//   }
//
//   void changeFilter(int index) {
//     selectedFilter.value = index;
//     fetchNews(); // reset and fetch new category
//   }
// }
