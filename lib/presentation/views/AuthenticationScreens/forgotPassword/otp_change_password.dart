import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/viewModel/controller/AuthControllers/forgot_password_controller.dart';
import '../../../../shared/constants/app_colors.dart';
import '../../../../widgets/buttons/cutsom_button.dart';

class OtpChangePassword extends StatelessWidget {
OtpChangePassword({super.key});

  final controller = Get.find<ForgotPasswordController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [Icon(Icons.arrow_back, size: 25)],
                ),
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
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: ' 👩‍💻 ',
                            style: TextStyle(fontSize: 35),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                const SizedBox(
                  width: 350,
                 child: Text(
                   'We have sent you otp **** to your email , Write teh otp down below:',
                   style: TextStyle(fontSize: 17),
                 ),
                ),

                const SizedBox(height: 30),

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
