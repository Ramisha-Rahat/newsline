import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "http://192.168.101.21:8000";

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
      return data["access_token"]; // Adjust if your key is different
    } else {
      print("Login failed: ${response.statusCode} - ${response.body}");
      return null;
    }
  }
}
