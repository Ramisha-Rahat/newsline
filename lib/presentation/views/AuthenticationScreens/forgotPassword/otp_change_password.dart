import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../domain/viewModel/controller/AuthControllers/forgot_password_controller.dart';
import '../../../../shared/constants/app_colors.dart';
import '../../../../shared/utils/responsive_utils.dart';
import '../../../../widgets/buttons/cutsom_button.dart';

class OtpChangePassword extends StatelessWidget {
OtpChangePassword({super.key});

  final controller = Get.find<ForgotPasswordController>();

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Responsive.padding(7)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'OTP Verification',
                            style: TextStyle(
                              fontSize: 30,
                              color: colorScheme.onSurface,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: ' 👩‍💻 ',
                            style: TextStyle(fontSize: Responsive.fontSize(6)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: Responsive.screenHeight * 0.03),

                const SizedBox(
                  width: 350,
                 child: Text(
                   'We have sent you otp **** to your email , Write teh otp down below:',
                   style: TextStyle(fontSize: 17),
                 ),
                ),

                SizedBox(height: Responsive.screenHeight * 0.05),

                Form(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(4, (index) {
                      return SizedBox(
                        width: 60,
                        child: Obx(() => TextFormField(
                          maxLength: 1,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          style: TextStyle(fontSize: 24),
                          decoration: InputDecoration(
                            counterText: '',
                            border: OutlineInputBorder(),
                            errorText: controller.isOtpValid.value ? null : '',
                          ),
                          onChanged: (val) {
                            controller.otpDigits[index].value = val;
                            if (val.isNotEmpty && index < 3) {
                              FocusScope.of(context).nextFocus();
                            } else if (val.isEmpty && index > 0) {
                              FocusScope.of(context).previousFocus();
                            }
                          },
                        )),
                      );
                    })
                  ),
                ),

                const SizedBox(height: 30),


                SizedBox(
                  height: 60,
                  width: 350,
                  child: CustomTextButton(
                    onPressed: () {
                      controller.verifyOtp();
                    },
                    child: Text('Verify OTP'),
                    foregroundColor: AppColors.white,
                    backgroundColor: AppColors.primary,

                    ),
                  ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
