import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsline/shared/utils/responsive_utils.dart';
import '../../../domain/viewModel/controller/OnboardingControllers/onboarding_controller.dart';

class CountrySelectionScreen extends StatelessWidget {
  CountrySelectionScreen({super.key});

  final controller = Get.find<OnboardingController>();

  @override
  Widget build(BuildContext context) {


    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: Responsive.padding(7)),
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Where do you come from?',
                    style: TextStyle(
                      fontSize: Responsive.fontSize(5),
                      color: colorScheme.onSurface,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Select your country of origin. This will help us to make the best recommendations for you.',
    style:TextStyle(fontSize:Responsive.fontSize(4)),
            ),
            SizedBox(height: 20),
            TextField(
              controller: controller.searchController,
              decoration: InputDecoration(
                hintText: 'Pakist...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: colorScheme.surface
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
                              backgroundColor: colorScheme.surface,
                              icon: Icon(Icons.done_outline),
                              title: Text('You have selected $selectedCountry', style: TextStyle(color: colorScheme.onSurface),),
                              actions: <Widget>[
                                TextButton(
                                  child:Text('No', style: TextStyle(color: colorScheme.onSurface),),
                                  onPressed: () {
                                    Navigator.of(
                                      context,
                                    ).pop(); // Close the dialog
                                  },
                                ),
                                TextButton(
                                  child: Text('Yes',style: TextStyle(color: colorScheme.onSurface)),
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
                          color:colorScheme.surface,
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
