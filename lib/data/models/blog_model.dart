class Blog {
  final int id;
  final String title;
  final String content;
  final String author;
  final String imageUrl;
  final DateTime date;
  final bool isDraft;

  Blog({
    required this.id,
    required this.title,
    required this.content,
    required this.author,
    required this.imageUrl,
    required this.date,
    required this.isDraft,
  });

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      author: json['author'],
      imageUrl: json['image_url'],
      date: DateTime.parse(json['date']),
      isDraft: json['is_draft'],
    );
  }
}
