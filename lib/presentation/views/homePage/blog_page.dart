import 'package:flutter/material.dart';
import 'package:newsline/shared/utils/responsive_utils.dart';

import '../../../widgets/cards/blog_card_widget.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: Text('Blog')),
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

            Expanded(
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return buildBlogCard(colorScheme, context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
