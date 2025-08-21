import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:newsline/domain/viewModel/controller/HomeScreenControllers/blog_controller.dart';
import 'package:newsline/shared/utils/responsive_utils.dart';
import '../../../widgets/cards/blog_card_widget.dart';
import 'package:get/get.dart';

class BlogPage extends StatelessWidget {
   BlogPage({super.key});


   final BlogController controller =Get.find<BlogController>();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: Text('BLOG')),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Responsive.padding(7),
          vertical: Responsive.padding(4),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Today`s Top Blogs',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Responsive.fontSize(6),
                color: colorScheme.onSurface,
              ),
            ),
            SizedBox(height: Responsive.screenHeight * 0.02),

        Obx(() => Expanded(
          child: controller.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : controller.blogs.isEmpty
              ? Center(child: Text("No blogs yet", style:TextStyle(fontSize: Responsive.fontSize(4))))
              : ListView.builder(
            itemCount: controller.blogs.length,
            itemBuilder: (context, index) {
              final blog = controller.blogs[index];
              return buildBlogCard(colorScheme, context, blog);
            },
          ),
        )),
          ],
        ),
      ),
    );
  }
}
