class Blog {
  final int id;
  final int authorId;
  final String title;
  final String content;
  final String? coverImageUrl;
  final DateTime createdAt;
  final DateTime updatedAt;

  Blog({
    required this.id,
    required this.authorId,
    required this.title,
    required this.content,
    this.coverImageUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      id: json['id'],
      authorId: json['author_id'],
      title: json['title'],
      content: json['content'],
      coverImageUrl: json['cover_image_url'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
