import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeScreenController extends GetxController {
 var isLoading = false;
 var selectedFilter = 0;
 var topNews = [].obs;
 var categoryNews = [].obs;

 final String apiKey = "05fa112b71d9410aaa437ec1989645cc";
 final String baseUrl = "https://newsapi.org/v2";

 final List<String> categories = [
  "All",
  "Business",
  "Technology",
  "Health",
  "Sports",
  "Science",
  "Entertainment",
 ];

 Future<void> fetchTopNews() async {
  try {
   isLoading = true;
   update();

   final response = await http.get(Uri.parse(
       "$baseUrl/top-headlines?country=us&pageSize=5&apiKey=$apiKey"));

   if (response.statusCode == 200) {
    final data = json.decode(response.body);
    topNews.value = data["articles"] ?? [];
   }
  } catch (e) {
   print("Error fetching top news: $e");
  } finally {
   isLoading = false;
   update();
  }
 }

 Future<void> fetchCategoryNews(String category, {int page = 1}) async {
  try {
   isLoading = true;
   update();

   String url;
   if (category == "All") {
    url =
    "$baseUrl/top-headlines?country=us&pageSize=10&page=$page&apiKey=$apiKey";
   } else {
    url =
    "$baseUrl/top-headlines?country=us&category=${category.toLowerCase()}&pageSize=10&page=$page&apiKey=$apiKey";
   }

   final response = await http.get(Uri.parse(url));

   if (response.statusCode == 200) {
    final data = json.decode(response.body);
    categoryNews.value = data["articles"] ?? [];
   }
  } catch (e) {
   print("Error fetching category news: $e");
  } finally {
   isLoading = false;
   update();
  }
 }

 void refreshNews() {
  fetchTopNews();
  fetchCategoryNews(categories[selectedFilter]);
 }

 @override
 void onInit() {
  super.onInit();
  refreshNews();
 }
}
