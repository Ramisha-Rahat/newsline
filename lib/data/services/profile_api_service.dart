import 'dart:convert';
import 'package:http/http.dart' as http;

class ProfileApiService {
  final String baseUrl = "http://192.168.100.140:8000"; // change to your FastAPI IP & port

  // ✅ Create Profile
  Future<Map<String, dynamic>?> createProfile({
    required int userId,
    required String bio,
    required String location,
    String? avatarUrl,
  }) async {
    final url = Uri.parse("$baseUrl/profile/");
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "user_id": userId,
        "bio": bio,
        "location": location,
        "avatar_url": avatarUrl,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to create profile: ${response.body}");
    }
  }

  // ✅ Get Profile by ID
  Future<Map<String, dynamic>?> getProfile(int profileId) async {
    final url = Uri.parse("$baseUrl/profile/$profileId");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to fetch profile: ${response.body}");
    }
  }

  // ✅ Update Profile
  Future<Map<String, dynamic>?> updateProfile({
    required int profileId,
    String? bio,
    String? location,
    String? avatarUrl,
  }) async {
    final url = Uri.parse("$baseUrl/profile/$profileId");
    final response = await http.put(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "bio": bio,
        "location": location,
        "avatar_url": avatarUrl,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to update profile: ${response.body}");
    }
  }

  // ✅ Delete Profile
  Future<void> deleteProfile(int profileId) async {
    final url = Uri.parse("$baseUrl/profile/$profileId");
    final response = await http.delete(url);

    if (response.statusCode != 200) {
      throw Exception("Failed to delete profile: ${response.body}");
    }
  }
}
