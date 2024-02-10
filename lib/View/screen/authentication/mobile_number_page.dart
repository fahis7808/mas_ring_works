import 'package:flutter/material.dart';
import 'package:mas_ring_works/View/widget/custom_textfield.dart';
import 'package:mas_ring_works/constants/app_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../../../provider/authentication_provider.dart';
import '../../widget/custom_button/custom_button.dart';

class MobileNumberPage extends StatelessWidget {
  const MobileNumberPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => AuthenticationProvider(),
        child: Consumer<AuthenticationProvider>(builder: (context, data, _) {
          return Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(
                  flex: 8,
                ),
                Text(
                  "Enter Your Mobile\n Number",
                  style: AppFont.largeText,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "We will send you a text verification code",
                  style: AppFont.grayText,
                ),
                Spacer(
                  flex: 3,
                ),
                CustomTextField(
                  value: data.userData.phoneNumber?.toString() ?? "",
                  text: "Mobile Number",
                  onChanged: (val){
                    data.userData.phoneNumber = val;
                  },
                ),
                Spacer(
                  flex: 3,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: CustomButton(
                      text: "SENT OTP",
                      onTap: () {

                        data.signInWithPhone(context);
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => VerificationPage()));
                      }),
                ),
                Spacer(
                  flex: 1,
                ),
                Spacer(
                  flex: 7,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
