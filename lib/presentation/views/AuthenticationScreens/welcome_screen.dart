import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:newsline/shared/constants/app_colors.dart';
import 'package:newsline/widgets/buttons/cutsom_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

  //final ThemeController controller = Get.find();

    return Scaffold(
      // appBar: AppBar(
      //    actions: [
      //     Obx(()=> Switch(value: controller.isDarkMode.value, onChanged: (val)=>
      //       controller.toggleTheme(),
      //     ),
      //     ),
      //    ],
      //
      // ),
      body: Center(
       child: Column(children:[
        Image.asset(
          'assets/images/logo.png',
          height: 200,
        ),
        const SizedBox(height: 20,),
        Text('NEWSLINE',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20,),
        Text(
          'Welcome, Let`s dive into your account',
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey[700],
        ),
        ),
        const SizedBox(height: 50,),
        
        SizedBox(
          height: 60,
          width: 350,
          child: CustomTextButton(
           onPressed:(){

           },
            foregroundColor: AppColors.darkBackground,
             backgroundColor: AppColors.darkText,
             borderColor: AppColors.black,
              child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/google-color-svgrepo-com.svg', height: 35,),
                 SizedBox(width: 10,),
                 Text('Continue With Google', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
              ],)
               ),
        ),
         const SizedBox(height: 15,),
         SizedBox(
           height: 60,
           width: 350,
           child: CustomTextButton(
               onPressed:(){},
               foregroundColor: AppColors.darkBackground,
               backgroundColor: AppColors.darkText,
               borderColor: AppColors.black,
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   SvgPicture.asset(
                     'assets/images/apple-173-svgrepo-com.svg', height: 35,),
                   SizedBox(width: 10,),
                   Text('Continue With Apple', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
                 ],)
           ),
         ),
         const SizedBox(height: 15,),
         SizedBox(
           height: 60,
           width: 350,
           child: CustomTextButton(
               onPressed:(){},
               foregroundColor: AppColors.darkBackground,
               backgroundColor: AppColors.darkText,
               borderColor: AppColors.black,
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   SvgPicture.asset(
                     'assets/images/facebook-color-svgrepo-com.svg', height: 35,),
                   SizedBox(width: 10,),
                   Text('Continue With Facebook', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
                 ],)
           ),
         ),

         const SizedBox(height: 100,),

         SizedBox(
           height: 60,
           width: 350,
           child: CustomTextButton(
               onPressed:(){
                 Get.toNamed('/signIn');
               },
               foregroundColor: AppColors.white,
               backgroundColor: AppColors.primary,
               borderColor: Colors.transparent,
               child:
                 Center(child: Text('Sign In With Password', style: TextStyle(fontWeight: FontWeight.bold
                 , fontSize: 18),))
               ),
         ),
         const SizedBox(height: 50,),
         RichText(
           text: TextSpan(
             text: "Don't have an Account ?",
             style: TextStyle(fontSize: 15, color: AppColors.black),
             children: [
               TextSpan(
                 text: ' Sign Up',
                 style: TextStyle(
                   fontWeight: FontWeight.bold,
                   color: AppColors.primary,
                 ),
                 recognizer: TapGestureRecognizer()
                   ..onTap = () {
                     Get.toNamed('/signUp');
                   },
               ),
             ],
           ),
         )
 

       ]
       ),
      ),
    );
  }
}