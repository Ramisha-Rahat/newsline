import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:newsline/domain/viewModel/controller/HomeScreenControllers/edit_profile_controller.dart';
import 'package:newsline/shared/utils/responsive_utils.dart';
import '../../../shared/constants/app_colors.dart';
import '../../../widgets/buttons/cutsom_button.dart';

class EditProfilePage extends StatelessWidget {
  EditProfilePage({super.key});

  final EditProfileController controller = Get.find<EditProfileController>();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          'Edit Profile',
          style: TextStyle(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Responsive.padding(7)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: Responsive.screenHeight * 0.02),
              SizedBox(
                child: Stack(
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
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.edit, color: Colors.white, size: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: Responsive.screenHeight * 0.05),

              Form(
                child: Column(
                  children: [
                    SizedBox(height: Responsive.screenHeight * 0.01),
                    TextFormField(
                      decoration: InputDecoration(
                        label: Text('Name'),
                        hintStyle: TextStyle(color: AppColors.secondary),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: colorScheme.surface,
                      ),
                    ),

                    SizedBox(height: Responsive.screenHeight * 0.02),

                    SizedBox(height: Responsive.screenHeight * 0.01),
                    TextFormField(
                      decoration: InputDecoration(
                        label: Text('Bio'),
                        hintStyle: TextStyle(color: AppColors.secondary),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: colorScheme.surface,
                      ),
                    ),
                    SizedBox(height: Responsive.screenHeight * 0.04),
                    TextFormField(
                      decoration: InputDecoration(
                        label: Text('Location'),
                        suffixIcon: Icon(Icons.location_on, color: colorScheme.onSurface,),
                        hintStyle: TextStyle(color: AppColors.secondary),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: colorScheme.surface,
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
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
