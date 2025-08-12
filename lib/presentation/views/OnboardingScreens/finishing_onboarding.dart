import 'package:flutter/material.dart';

import '../../../shared/constants/app_colors.dart';
import '../../../widgets/buttons/cutsom_button.dart';

class FinishingOnboarding extends StatelessWidget {
  const FinishingOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Finishing Onboarding'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
      ),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.done_all_outlined, size: 100, color: AppColors.primary),
            Text(
              'You`re All Set',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text( 
              'Thank you for completing the onboarding process. You can now enjoy all the features of our app  and expolore.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
               SizedBox(
              height: 60,
              width: 350,
              child: CustomTextButton(
                  onPressed:(){},
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