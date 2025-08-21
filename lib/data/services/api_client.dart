import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class ApiClient {
  final String baseUrl = "http://192.168.101.21:8000";

  Future<String?> _getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("access_token");
  }

  Future<void> _saveTokens(String accessToken, String refreshToken) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("access_token", accessToken);
    await prefs.setString("refresh_token", refreshToken);
  }

  Future<String?> _refreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    final refreshToken = prefs.getString("refresh_token");

    if (refreshToken == null) {
      Get.offAllNamed("/login");
      return null;
    }

    final response = await http.post(
      Uri.parse("$baseUrl/auth/refresh"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"refresh_token": refreshToken}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      await _saveTokens(data["access_token"], data["refresh_token"]);
      return data["access_token"];
    } else {
      await prefs.clear();
      Get.offAllNamed("/login");
      return null;
    }
  }

  Future<http.Response> _sendRequest(Future<http.Response> Function(String token) requestFn) async {
    String? token = await _getAccessToken();
    if (token == null) {
      Get.offAllNamed("/login");
      throw Exception("Not authenticated");
    }

    var response = await requestFn(token);

    // If token expired → refresh and retry once
    if (response.statusCode == 401) {
      token = await _refreshToken();
      if (token != null) {
        response = await requestFn(token);
      }
    }
    return response;
  }

  // Common GET
  Future<Map<String, dynamic>> get(String endpoint) async {
    final response = await _sendRequest((token) {
      return http.get(
        Uri.parse("$baseUrl$endpoint"),
        headers: {"Authorization": "Bearer $token"},
      );
    });

    return _processResponse(response);
  }

  // Common POST
  Future<Map<String, dynamic>> post(String endpoint, Map<String, dynamic> body) async {
    final response = await _sendRequest((token) {
      return http.post(
        Uri.parse("$baseUrl$endpoint"),
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        },
        body: jsonEncode(body),
      );
    });

    return _processResponse(response);
  }

  // Common PUT
  Future<Map<String, dynamic>> put(String endpoint, Map<String, dynamic> body) async {
    final response = await _sendRequest((token) {
      return http.put(
        Uri.parse("$baseUrl$endpoint"),
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        },
        body: jsonEncode(body),
      );
    });

    return _processResponse(response);
  }

  // Common DELETE
  Future<Map<String, dynamic>> delete(String endpoint) async {
    final response = await _sendRequest((token) {
      return http.delete(
        Uri.parse("$baseUrl$endpoint"),
        headers: {"Authorization": "Bearer $token"},
      );
    });

    return _processResponse(response);
  }

  Map<String, dynamic> _processResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    } else {
      throw Exception("API Error: ${response.statusCode} - ${response.body}");
    }
  }
}
