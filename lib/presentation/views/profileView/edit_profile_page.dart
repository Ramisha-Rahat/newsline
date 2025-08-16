import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:newsline/domain/viewModel/controller/HomeScreenControllers/edit_profile_controller.dart';
import 'package:newsline/shared/utils/responsive_utils.dart';

class EditProfilePage extends StatelessWidget {
 EditProfilePage({super.key});


  final EditProfileController controller=Get.find<EditProfileController>();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          'Edit Profile',
          style: TextStyle(color: colorScheme.onSurface),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Responsive.padding(7)),
        child: Column(
          children: [

            SizedBox(height: Responsive.screenHeight * 0.02),
            SizedBox(

              child:
              Stack(
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage('assets/images/test.jpg'),
                  ),
                  Positioned(
                   bottom: 2,
                    right: 5,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: colorScheme.primary,
                      child: const Icon(Icons.edit, color: Colors.white, size: 20),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Responsive.screenHeight * 0.05),

            Form(
              child: Column(
                children: [
                  Text(
                    'Name:',
                    style: TextStyle(fontSize: Responsive.fontSize(3)),
                  ),
                  SizedBox(height: Responsive.screenHeight * 0.01),
                  TextFormField(
                    textAlign: TextAlign.start,
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
