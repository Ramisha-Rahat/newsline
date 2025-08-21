// import 'package:flutter/material.dart';
// import 'package:newsline/data/models/blog_model.dart';
// import '../../shared/utils/responsive_utils.dart';
//
// Widget buildBlogCard(ColorScheme colorScheme, BuildContext context, Blog blog) {
//   return Container(
//     margin: const EdgeInsets.only(bottom: 16),
//     height: Responsive.screenHeight * 0.3,
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(25),
//       color: Colors.white,
//     ),
//     child: ClipRRect(
//       borderRadius: BorderRadius.circular(25),
//       child: Stack(
//         fit: StackFit.expand,
//         children: [
//           // Background Image
//           Image.asset(
//             "assets/images/test.jpg",
//             fit: BoxFit.cover,
//           ),
//
//           // Dark overlay
//           Container(
//             color: Colors.black.withOpacity(0.3),
//           ),
//
//           // Foreground Content
//           Padding(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.end,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Your Title Here",
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.white.withOpacity(0.8),
//                         foregroundColor: Colors.black,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                       onPressed: () {},
//                       child: const Text("Read More"),
//                     ),
//
//                     Row(
//                       children: [
//                         CircleAvatar(
//                           radius: 20,
//                           backgroundColor: colorScheme.primary,
//                         ),
//                         const SizedBox(width: 8),
//                         Column(
//                           children: [
//                             Text(
//                               'Name',
//                               style: TextStyle(
//                                 fontSize: Responsive.fontSize(3.5),
//                                 color: Colors.white,
//                               ),
//                             ),
//                             Text(
//                               'date',
//                               style: TextStyle(
//                                 fontSize: Responsive.fontSize(3),
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
import 'package:flutter/material.dart';
import '../../shared/utils/responsive_utils.dart';
import '../../data/models/blog_model.dart';

Widget buildBlogCard(ColorScheme colorScheme, BuildContext context, Blog blog) {
  return Container(
    margin: const EdgeInsets.only(bottom: 16),
    height: Responsive.screenHeight * 0.3,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25),
      color: Colors.white,
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Stack(
        fit: StackFit.expand,
        children: [
          blog.coverImageUrl != null && blog.coverImageUrl!.isNotEmpty
              ? Image.network(blog.coverImageUrl!, fit: BoxFit.cover)
              : Image.asset("assets/images/test.jpg", fit: BoxFit.cover),

          Container(color: Colors.black.withOpacity(0.3)),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  blog.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white.withOpacity(0.8),
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                      },
                      child: const Text("Read More"),
                    ),

                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: colorScheme.primary,
                        ),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              blog.authorId.toString(),
                              style: TextStyle(
                                fontSize: Responsive.fontSize(3.5),
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              blog.createdAt.split("T").first,
                              style: TextStyle(
                                fontSize: Responsive.fontSize(3),
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
