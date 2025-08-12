import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../shared/constants/app_colors.dart';
import '../../../widgets/buttons/cutsom_button.dart';

class ProfileSetupScreen extends StatelessWidget {
  const ProfileSetupScreen({super.key});

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
                    text: 'Create Public Profile ',
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
              'The profile will be publicly visible to other users. You can change it later.',
            ),
            SizedBox(height: 30),
            
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey[300],
              child: Icon(
                Icons.person,
                size: 50,
                color: Colors.grey[700],
              ),
            ),

            const SizedBox(height: 20,),
              
            Form(child: 
            
              Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Full Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                   TextFormField(
                    decoration: InputDecoration(
                      labelText: 'UserName',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Bio',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 3,
                  ),
                ],
              )
            ),

            SizedBox(height: 10),


            SizedBox(
              height: 60,
              width: 350,
              child: CustomTextButton(
                onPressed: () {

                },
                foregroundColor: AppColors.white,
                backgroundColor: AppColors.primary,
                borderColor: Colors.transparent,
                child: const Center(child: Text('Continue')),
              ),
            ),

          ]
            ),
      )
    );
  }
}
