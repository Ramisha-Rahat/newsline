import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:newsline/data/models/blog_model.dart';
import 'package:newsline/data/models/profile_model.dart';

class ProfileController extends GetxController {
  final String baseUrl = "http://192.168.101.21:8000";

  var profile = Rxn<Profile>();
  var blogs = <Blog>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadProfile();
    loadBlogs();
  }

  Future<void> loadProfile() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("access_token");

      if (token == null) {
        print(" No access token found");
        return;
      }

      final userRes = await http.get(
        Uri.parse("$baseUrl/auth/users/me"),
        headers: {"Authorization": "Bearer $token"},
      );

      final profileRes = await http.get(
        Uri.parse("$baseUrl/profile/me"),
        headers: {"Authorization": "Bearer $token"},
      );

      if (userRes.statusCode == 200) {
        final userData = jsonDecode(userRes.body);

        Map<String, dynamic>? profileData;
        if (profileRes.statusCode == 200) {
          final parsed = jsonDecode(profileRes.body);
          if (parsed is List && parsed.isNotEmpty) {
            profileData = Map<String, dynamic>.from(parsed.first);
          } else if (parsed is Map) {
            profileData = Map<String, dynamic>.from(parsed);
          }
        }
        profile.value = Profile.fromJson(userData, profileData);
      } else {
        print("Error loading user: ${userRes.body}");
      }
    } catch (e) {
      print(" Exception loading profile: $e");
    }
  }


  Future<void> loadBlogs() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("access_token");

      if (token == null) {
        print(" No access token found");
        return;
      }

      final response = await http.get(
        Uri.parse("$baseUrl/blog/me"),
        headers: {"Authorization": "Bearer $token"},
      );

      if (response.statusCode == 200) {
        final List<dynamic> blogData = jsonDecode(response.body);
        blogs.value = blogData.map((json) => Blog.fromJson(json)).toList();
      } else {
        print(" Error loading blogs: ${response.body}");
      }
    } catch (e) {
      print(" Exception loading blogs: $e");
    }
  }
}
