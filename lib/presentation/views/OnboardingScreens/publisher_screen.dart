import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/viewModel/controller/OnboardingControllers/onboarding_controller.dart';
import '../../../shared/constants/app_colors.dart';
import '../../../shared/utils/responsive_utils.dart';
import '../../../widgets/buttons/cutsom_button.dart';
class PublisherScreen extends StatelessWidget {
  const PublisherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Responsive.padding(7)),
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Follow Some Official Publisher',
                    style: TextStyle(
                      fontSize: Responsive.fontSize(5),
                      color: colorScheme.onSurface,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Responsive.screenHeight * 0.02),
            Text(
              'Follow Some Official Publishers that you may know and like to get updates on their stories',
              style: TextStyle(fontSize: Responsive.fontSize(4)),
            ),
            const SizedBox(height: 30),

            Expanded(
              child: ListView.separated(
                itemCount: 10,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  return PublisherTile(name: 'BBC NEWS');
                },
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(Responsive.padding(7)),
          child: SizedBox(
            height: 60,
            width: double.infinity,
            child: CustomTextButton(
              onPressed: () {
                final onboardingController = Get.find<OnboardingController>();
                onboardingController.pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease,
                );
              },
              foregroundColor: AppColors.white,
              backgroundColor: AppColors.primary,
              borderColor: Colors.transparent,
              child: const Center(child: Text('Continue')),
            ),
          ),
        ),
      ),
    );
  }
}

class PublisherTile extends StatefulWidget {
  final String name;

  const PublisherTile({super.key, required this.name});

  @override
  State<PublisherTile> createState() => _PublisherTileState();
}

class _PublisherTileState extends State<PublisherTile> {
  bool isFollowing = false;

  void toggleFollow() {
    setState(() {
      isFollowing = !isFollowing;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        CircleAvatar(
          child: Image.asset(
            'assets/images/bbc_logo.png',
            height: 50,
            width: 50,
          ),
        ),
        const SizedBox(width: 30),
        Text(widget.name, style: TextStyle(fontSize: Responsive.fontSize(5))),
        const Spacer(),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: isFollowing
                ? AppColors.secondary
                : AppColors.primary,
          ),
          onPressed: toggleFollow,
          child: Text(
            isFollowing ? 'Following' : 'Follow',
            style: TextStyle(
              fontSize: Responsive.fontSize(3),
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
