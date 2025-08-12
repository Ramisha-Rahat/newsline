import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/viewModel/controller/OnboardingControllers/onboarding_controller.dart';
import '../../../shared/constants/app_colors.dart';
import '../../../widgets/buttons/cutsom_button.dart';

class PublisherScreen extends StatelessWidget {
  const PublisherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Follow Some Official Publisher',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(text: ' 👩‍💻 ', style: TextStyle(fontSize: 35)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Follow Some Official Publishers that you may know and like to get updates on their stories',
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

            const SizedBox(height: 20),

            SizedBox(
              height: 60,
              width: 350,
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
          ],
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
    return Row(
      children: [
        CircleAvatar(
          child: Image.asset('assets/images/bbc_logo.png', height: 50, width: 50),
        ),
        const SizedBox(width: 30),
        Text(widget.name),
        const Spacer(),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: isFollowing ? AppColors.secondary : AppColors.primary,
          ),
          onPressed: toggleFollow,
          child: Text(isFollowing ? 'Following' : 'Follow'),
        ),
      ],
    );
  }
}
