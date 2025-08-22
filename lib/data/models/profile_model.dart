class Profile {
  final int id;
  final String username;
  final String email;
  final String? bio;
  final String? location;
  final String? avatarUrl;

  Profile({
    required this.id,
    required this.username,
    required this.email,
    this.bio,
    this.location,
    this.avatarUrl,
  });

  factory Profile.fromJson(Map<String, dynamic> userJson, Map<String, dynamic>? profileJson) {
    return Profile(
      id: userJson["id"],
      username: userJson["username"],
      email: userJson["email"],
      bio: profileJson?["bio"],
      location: profileJson?["location"],
      avatarUrl: profileJson?["avatar_url"],
    );
  }
}
