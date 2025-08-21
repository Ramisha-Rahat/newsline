import 'api_client.dart';

class ProfileApiService {
  final ApiClient _api = ApiClient();

  Future<Map<String, dynamic>> createProfile({
    required int userId,
    required String bio,
    required String location,
    String? avatarUrl,
  }) async {
    return await _api.post("/profile/", {
      "user_id": userId,
      "bio": bio,
      "location": location,
      "avatar_url": avatarUrl,
    });
  }

  Future<Map<String, dynamic>> getProfile(int profileId) async {
    return await _api.get("/profile/$profileId");
  }

  Future<Map<String, dynamic>> updateProfile({
    required int profileId,
    String? bio,
    String? location,
    String? avatarUrl,
  }) async {
    return await _api.put("/profile/$profileId", {
      "bio": bio,
      "location": location,
      "avatar_url": avatarUrl,
    });
  }

  Future<Map<String, dynamic>> deleteProfile(int profileId) async {
    return await _api.delete("/profile/$profileId");
  }
}
