import 'package:custom_cached_image/custom_cached_image_with_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import '../../../domain/viewModel/controller/HomeScreenControllers/blog_controller.dart';
import '../../../shared/utils/responsive_utils.dart';

class AddBlogPage extends StatelessWidget {
  AddBlogPage({super.key});


  final HtmlEditorController _editorController = HtmlEditorController();
  final BlogController blogController = Get.put(BlogController());

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          'Add Blog',
          style: TextStyle(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: Responsive.padding(5), vertical: Responsive.padding(3)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              'Title',
              style: TextStyle(fontSize: Responsive.fontSize(4.5), fontWeight: FontWeight.w600),
            ),
            SizedBox(height: Responsive.screenHeight * 0.01),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: TextFormField(
                style: TextStyle(fontSize: Responsive.fontSize(4)),
                decoration: InputDecoration(
                  hintText: 'Enter blog title',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
            ),
            SizedBox(height: Responsive.screenHeight * 0.03),

            // Image
            Text(
              'Add Image',
              style: TextStyle(fontSize: Responsive.fontSize(4.5), fontWeight: FontWeight.w600),
            ),
            SizedBox(height: Responsive.screenHeight * 0.01),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CustomCachedImage(
                imageUrl: 'https://example.com/sample.jpg',
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover, borderRadius:25 ,
              ),
            ),
            SizedBox(height: Responsive.screenHeight * 0.03),
            Text("Description", style: TextStyle(fontSize: Responsive.fontSize(4))),
            const SizedBox(height: 8),

            // HtmlEditor(
            //   controller: _editorController,
            //   htmlEditorOptions: HtmlEditorOptions(
            //     hint: "Write your blog content here...",
            //     autoAdjustHeight: true,
            //   ),
            //   htmlToolbarOptions: HtmlToolbarOptions(
            //     toolbarPosition: ToolbarPosition.aboveEditor,
            //     toolbarType: ToolbarType.nativeScrollable,
            //     defaultToolbarButtons: [
            //       StyleButtons(),
            //       FontButtons(),
            //       ColorButtons(),
            //       ListButtons(),
            //       ParagraphButtons(),
            //       InsertButtons(),
            //       OtherButtons(),
            //     ],
            //   ),
            //   otherOptions: OtherOptions(
            //     height: 300,
            //   ),
            // ),
            HtmlEditor(
              controller: _editorController,
              htmlEditorOptions: HtmlEditorOptions(
                hint: "Write your blog content...",
                autoAdjustHeight: true,
              ),
              htmlToolbarOptions: HtmlToolbarOptions(
                defaultToolbarButtons: [
                  FontButtons(),
                  ColorButtons(),
                ],
              ),
              otherOptions: OtherOptions(height: 300),
            )
,

            SizedBox(height: Responsive.screenHeight * 0.03),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Save Draft
              ElevatedButton.icon(
                onPressed: () async {
                  // String? content = await _editorController.getText();
                  // blogController.saveDraft("Draft Title", content ?? "", "CurrentUser", "assets/images/test.jpg");
                  // Get.snackbar("Draft Saved", "Your blog draft has been saved!");
                },
                icon: const Icon(Icons.save_alt),
                label: const Text("Save Draft"),
              ),

              // Publish
              ElevatedButton.icon(
                onPressed: () async {
              //    String? content = await _editorController.getText();
               //   blogController.publishBlog("My Blog Title", content ?? "", "CurrentUser", "assets/images/test.jpg");
               //    Get.snackbar("Blog Published", "Your blog is now live!");
               //    Get.toNamed("/blogPage"); // redirect to published blogs page
                },
                icon: const Icon(Icons.check),
                label: const Text("Publish"),
              ),
            ],
          ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     ElevatedButton.icon(
            //       onPressed: () async {
            //         String? content = await _editorController.getText();
            //         print("Draft saved: $content"); // Replace with draft logic
            //         Get.snackbar("Draft Saved", "Your blog draft has been saved!");
            //       },
            //       icon: const Icon(Icons.save_alt),
            //       label: const Text("Save Draft"),
            //       style: ElevatedButton.styleFrom(
            //         backgroundColor: colorScheme.secondary,
            //         foregroundColor: Colors.white,
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(12),
            //         ),
            //       ),
            //     ),
            //     ElevatedButton.icon(
            //       onPressed: () async {
            //         String? content = await _editorController.getText();
            //         print("Blog saved: $content"); // Replace with save logic
            //         Get.snackbar("Blog Saved", "Your blog has been published!");
            //       },
            //       icon: const Icon(Icons.check),
            //       label: const Text("Publish"),
            //       style: ElevatedButton.styleFrom(
            //         backgroundColor: colorScheme.primary,
            //         foregroundColor: Colors.white,
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(12),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),


            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

//             // Description
//             Text(
//               'Description',
//               style: TextStyle(fontSize: Responsive.fontSize(4.5), fontWeight: FontWeight.w600),
//             ),
//             SizedBox(height: Responsive.screenHeight * 0.01),
//             Card(
//               elevation: 2,
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//               child: TextFormField(
//                 maxLines: 6,
//                 style: TextStyle(fontSize: Responsive.fontSize(4)),
//                 decoration: InputDecoration(
//                   hintText: 'Write your blog here...',
//                   border: InputBorder.none,
//                   contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                 ),
//               ),
//             ),
//             SizedBox(height: Responsive.screenHeight * 0.04),
//
//             // Buttons
//             Row(
//               children: [
//                 Expanded(
//                   child: ElevatedButton(
//                     onPressed: () {
//                       // TODO: Implement Save Draft functionality
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: AppColors.secondary.withOpacity(0.8),
//                       foregroundColor: Colors.white,
//                       padding: EdgeInsets.symmetric(vertical: 16),
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                     ),
//                     child: Text(
//                       'Save Draft',
//                       style: TextStyle(fontSize: Responsive.fontSize(4)),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: Responsive.screenWidth * 0.03),
//                 Expanded(
//                   child: ElevatedButton(
//                     onPressed: () {
//                       // TODO: Implement Save functionality
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: colorScheme.primary,
//                       foregroundColor: Colors.white,
//                       padding: EdgeInsets.symmetric(vertical: 16),
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                     ),
//                     child: Text(
//                       'Save',
//                       style: TextStyle(fontSize: Responsive.fontSize(4)),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: Responsive.screenHeight * 0.03),
//           ],
//         ),
//       ),
//     );
//   }
// }
