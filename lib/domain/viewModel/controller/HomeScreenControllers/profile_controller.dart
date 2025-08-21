import 'dart:convert';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'package:newsline/data/models/blog_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../data/models/profile_model.dart';

class ProfileController extends GetxController {
  final String baseUrl = "http://192.168.101.21:8000";

  var profile = Rxn<Profile>();

  @override
  void onInit() {
    super.onInit();
    loadProfile();
    loadBlogs();
  }

  Future<void> loadProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("access_token");

    final response = await http.get(
      Uri.parse("$baseUrl/auth/users/me"),
      headers: {"Authorization": "Bearer $token"},
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      profile.value = Profile.fromJson(data);
    } else {
      print("Error: ${response.body}");
    }
  }


  RxList blog= <Blog>[].obs;
  // Future<void> loadBlogs() async{
  //
  //   final prefs=await SharedPreferences.getInstance();
  //   final token=prefs.getString("access_token");
  //
  //   final response=await http.get(
  //     Uri.parse("$baseUrl/blog"),
  //     headers: {"Authorization" : "Bearer $token"},
  //   );
  //
  //   if(response.statusCode==200){
  //     final blogData=jsonDecode(response.body);
  //     blog.value=Blog.fromJson(blogData) as List;
  //   }else
  //     {
  //       print("error: ${response.body}");
  //     }
  //
  // }
  Future<void> loadBlogs() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("access_token");

    final response = await http.get(
      Uri.parse("$baseUrl/blog/me"),
      headers: {"Authorization": "Bearer $token"},
    );

    if (response.statusCode == 200) {
      final List<dynamic> blogData = jsonDecode(response.body);
      blog.value = blogData.map((json) => Blog.fromJson(json)).toList();
    } else {
      print("Error: ${response.body}");
    }
  }


}

