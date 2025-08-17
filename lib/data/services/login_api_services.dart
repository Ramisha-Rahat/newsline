import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/profile_model.dart';

class ApiService {
  final String baseUrl = "http://192.168.100.140:8000";

  Future<void> getRoot(String token) async {
    final response = await http.get(
      Uri.parse("$baseUrl/"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      print("Response: ${jsonDecode(response.body)}");
    } else {
      print("Error: ${response.statusCode}");
    }
  }

  Future<String?> login(String email, String password) async {
    final response = await http.post(
      Uri.parse("$baseUrl/auth/login"),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "email": email,
        "password": password,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data["access_token"];
    } else {
      final error = jsonDecode(response.body);
      throw Exception(error["detail"] ?? "Login failed");
    }
  }


  Future<String?> signUp(String username, String email, String password, String confirm_password) async {
    final response = await http.post(
      Uri.parse("$baseUrl/auth/register"),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "username": username,
        "email": email,
        "password": password,
        "confirm_password":confirm_password
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);
      return data["access_token"];
    } else {
      final error = jsonDecode(response.body);
      throw Exception(error["detail"] ?? "Unknown error");
    }

  }






}
