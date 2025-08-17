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

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json["id"],
      username: json["username"],
      email: json["email"],
      bio: json["profile"]?["bio"],
      location: json["profile"]?["location"],
      avatarUrl: json["profile"]?["avatar_url"],
    );
  }
}
