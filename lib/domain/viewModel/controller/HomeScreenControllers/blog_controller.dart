import 'package:get/get.dart';

import '../../../../data/models/blog_model.dart';


class BlogController extends GetxController {
  var blogs = <Blog>[].obs;
// final Dio dio = Dio(BaseOptions(baseUrl: "http://10.0.2.2:8000")); // replace with your API
//
// // Fetch all published blogs
// Future<void> fetchPublishedBlogs() async {
//   final res = await dio.get("/blogs");
//   blogs.value = (res.data as List).map((json) => Blog.fromJson(json)).toList();
// }
//
// // Fetch user blogs
// Future<void> fetchUserBlogs(String username) async {
//   final res = await dio.get("/blogs/user/$username");
//   blogs.value = (res.data as List).map((json) => Blog.fromJson(json)).toList();
// }

// Save draft
//   Future<void> saveDraft(String title, String content, String author, String imageUrl) async {
//     await dio.post("/blogs/draft", data: {
//       "title": title,
//       "content": content,
//       "author": author,
//       "image_url": imageUrl,
//     });
//     await fetchUserBlogs(author);
//   }
//
//   // Publish
//   Future<void> publishBlog(String title, String content, String author, String imageUrl) async {
//     await dio.post("/blogs", data: {
//       "title": title,
//       "content": content,
//       "author": author,
//       "image_url": imageUrl,
//     });
//     await fetchPublishedBlogs();
//   }
// }
}
