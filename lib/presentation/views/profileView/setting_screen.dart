import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:newsline/widgets/expand_tile/expand_tile.dart';
import 'package:newsline/widgets/text_with_toggle/toggle_line.dart';

import '../../../shared/utils/responsive_utils.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

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
          'Settings',
          style: TextStyle(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Responsive.padding(7)),
        child: Column(
          children: [

            SizedBox(height: Responsive.screenHeight * 0.02),

            ExpandedTile(
              label: "Account",
              children: [
                ListTile(
                  title: const Text("Profile"),
                  onTap: () {
                    // navigate to profile
                  },
                ),
                ListTile(
                  title: const Text("Change Password"),
                  onTap: () {},
                ),
              ],
            ),
            ExpandedTile(
              label: "Notifications",
              children: [
                ToggleLine(label: 'Push Notification'),
                SizedBox(height: Responsive.screenHeight * 0.02),
                ToggleLine(label: 'Email Notification'),
                SizedBox(height: Responsive.screenHeight * 0.02),
                ToggleLine(label: 'Theme Notification'),
                SizedBox(height: Responsive.screenHeight * 0.02),
              ],
            ),
            ExpandedTile(
              label: "Privacy",
              children: [
                ListTile(
                  title: const Text("Blocked Users"),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text("Two-Factor Authentication"),
                  onTap: () {},
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
