import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../domain/viewModel/controller/OnboardingControllers/onboarding_controller.dart';
import '../../../shared/constants/app_colors.dart';
import '../../../widgets/buttons/cutsom_button.dart';

class NewsFeedSelectionScreen extends StatelessWidget {
  const NewsFeedSelectionScreen({super.key});

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
                    text: 'Customize your news feed ',
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
            SizedBox(height: 20),
            Text(
              'Tell us what you are interested in tailoring to track your news experience',
            ),
            SizedBox(height: 40),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: List.generate(10, (index) {
                  return Container(
                    child: Center(
                      child: Text(
                        'Item $index',
                        style: TextTheme.of(context).headlineMedium
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: AppColors.tertiary),
                        left: BorderSide(color: AppColors.tertiary),
                        right: BorderSide(color: AppColors.tertiary),
                        bottom: BorderSide(color: AppColors.tertiary)
                      ),
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topRight: Radius.circular(10), topLeft: Radius.circular(10),bottomRight: Radius.circular(10),),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(height: 20,),

            SizedBox(
              height: 60,
              width: 350,
              child: CustomTextButton(
                  onPressed:(){
                    final onboardingController =
                    Get.find<OnboardingController>();
                 //   Navigator.of(context).pop();
                    onboardingController.pageController
                        .nextPage(
                      duration: Duration(
                        milliseconds: 300,
                      ),
                      curve: Curves.ease,
                    );
                  },
                  foregroundColor: AppColors.white,
                  backgroundColor: AppColors.primary,
                  borderColor: Colors.transparent,
                  child:
                  Center(child: Text('Continue'))
              ),
            ),
          ],
        ),
      ),
    );
  }
}
