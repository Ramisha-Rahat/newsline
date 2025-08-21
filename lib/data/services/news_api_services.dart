import 'dart:convert';
import 'package:http/http.dart' as http;

class NewsService {
  final String apiKey = "05fa112b71d9410aaa437ec1989645cc";
  final String baseUrl = "https://newsapi.org/v2";

  Future<List<dynamic>> fetchNewsByCategory(String category, {int page = 1}) async {
    String url;

    if (category == "All") {
      url = "$baseUrl/top-headlines?country=us&pageSize=10&page=$page&apiKey=$apiKey";
    } else {
      url = "$baseUrl/top-headlines?country=us&category=${category.toLowerCase()}&pageSize=10&page=$page&apiKey=$apiKey";
    }

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data["articles"] ?? [];
    } else {
      throw Exception("Failed to load news: ${response.body}");
    }
  }
}