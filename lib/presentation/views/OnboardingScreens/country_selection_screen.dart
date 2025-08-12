import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/viewModel/controller/OnboardingControllers/onboarding_controller.dart';

class CountrySelectionScreen extends StatelessWidget {
  CountrySelectionScreen({super.key});

  final controller = Get.find<OnboardingController>();

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
                    text: 'Where do you come from?',
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
              'Select your country of origin. This will help us to make the best recommendations for you.',
            ),
            SizedBox(height: 20),
            TextField(
              controller: controller.searchController,
              decoration: InputDecoration(
                hintText: 'United...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.grey.shade100,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Obx(() {
                final filtered = controller.filteredCountries;

                return ListView.separated(
                  itemCount: filtered.length,
                  separatorBuilder: (context, index) => SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    final country = filtered[index];
                    return GestureDetector(
                      onTap: () {
                        var selectedCountry = country.name;

                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: Colors.grey[100],
                              icon: Icon(Icons.done_outline),
                              title: Text('You have selected $selectedCountry'),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('No'),
                                  onPressed: () {
                                    Navigator.of(
                                      context,
                                    ).pop(); // Close the dialog
                                  },
                                ),
                                TextButton(
                                  child: const Text('Yes'),
                                  onPressed: () {
                                    final onboardingController =
                                        Get.find<OnboardingController>();
                                    onboardingController.selectCountry(country);
                                    Navigator.of(context).pop();
                                      onboardingController.pageController
                                          .nextPage(
                                            duration: Duration(
                                              milliseconds: 300,
                                            ),
                                            curve: Curves.ease,
                                          );

                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Wrap(
                          children: [
                            Text(
                              country.flagEmoji,
                              style: TextStyle(fontSize: 24),
                            ),
                            SizedBox(width: 10),
                            Text(country.name, style: TextStyle(fontSize: 18)),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
