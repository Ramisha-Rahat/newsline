import 'package:flutter/material.dart';
import 'package:newsline/shared/constants/app_colors.dart';
class SuccessCard extends StatelessWidget {
  final String title;
  final String message;
  final Image image;

  const SuccessCard({
    super.key,
    required this.title,
    required this.message,
    required this.image
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green[100],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: AppColors.primary,
              child: image,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(message, style: TextStyle(fontSize: 16)),
                  SizedBox(height: 10,),
                  CircularProgressIndicator(
                    color: AppColors.primary
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
