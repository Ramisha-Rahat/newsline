import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsline/shared/utils/responsive_utils.dart';

import '../../../core/routes/route_names.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:  Text("Profile", style: TextStyle(color: colorScheme.onSurface),),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Responsive.padding(7)),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings,
                color: colorScheme.onSurface,
                size: 28,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(Responsive.padding(7)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Center(
              child:
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/images/test.jpg'),
                  ),


            ),
            SizedBox(height: Responsive.screenHeight * 0.02),


            Text(
              "Ramisha Rahat",
              style: TextStyle(
                fontSize: Responsive.fontSize(4.2),
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
            ),
            SizedBox(height: Responsive.screenHeight * 0.005),


            Text(
              "ramisha@example.com",
              style: TextStyle(
                fontSize: Responsive.fontSize(3.4),
                color: Colors.grey,
              ),
            ),
            SizedBox(height: Responsive.screenHeight * 0.01),


            Text(
              "Flutter Developer-Traveler",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: Responsive.fontSize(3.2),
                color: colorScheme.onSurface,
              ),
            ),

            SizedBox(height: Responsive.screenHeight * 0.02),


            SizedBox(
              width: Responsive.screenWidth*0.7,
              child: ElevatedButton(
                onPressed: () {

                  Get.toNamed(RouteNames.editProfileScreen);

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.primary,
                  padding: EdgeInsets.symmetric(vertical: Responsive.padding(3)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  "Edit Profile",
                  style: TextStyle(
                    fontSize: Responsive.fontSize(3.6),
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            SizedBox(height: Responsive.screenHeight * 0.03),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                final colors = [
                  Colors.red,
                  Colors.blue,
                  Colors.green,
                  Colors.orange,
                  Colors.purple,
                  Colors.teal,
                ];
                return Container(
                  decoration: BoxDecoration(
                    color: colors[index],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      "Story ${index + 1}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: Responsive.fontSize(3.4),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
