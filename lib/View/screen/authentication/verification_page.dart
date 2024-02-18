import 'package:flutter/material.dart';
import 'package:mas_ring_works/View/widget/circular_progress_indicator.dart';
import 'package:mas_ring_works/constants/app_fonts.dart';
import 'package:mas_ring_works/provider/authentication_provider.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../../../constants/app_colors.dart';
import '../../widget/custom_button/custom_button.dart';

class VerificationPage extends StatelessWidget {
  final String verificationId;

  const VerificationPage({super.key, required this.verificationId});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthenticationProvider(),
      child: Consumer<AuthenticationProvider>(builder: (context, data, _) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(
                  flex: 8,
                ),
                Text(
                  "OTP Verification",
                  style: AppFont.largeText,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Enter the verification code we send your\n mobile number 8893288945",
                      textAlign: TextAlign.center,
                      style: AppFont.grayText,
                    ),
                  ],
                ),
                Spacer(
                  flex: 2,
                ),
                Pinput(
                  length: 6,
                  showCursor: true,
                  defaultPinTheme: PinTheme(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: AppColors.cardColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.primaryColor)),
                      textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: AppColors.secondaryColor)),
                  onChanged: (val) {
                    data.smsCode = val;
                  },
                ),
                Spacer(
                  flex: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't Receive the code? ",
                      style: AppFont.grayText,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text('Resend', style: AppFont.smallText)),
                  ],
                ),
                Spacer(
                  flex: 1,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: CustomButton(
                      text: "VERIFY",
                      widget: data.isLoaded ? CustomCircularProgressIndicator(isButton: true,) : null,
                      onTap: () {
                        data.verifyOtp(
                            context: context, verificationId: verificationId);
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationPage()));
                      }),
                ),
                Spacer(
                  flex: 8,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
