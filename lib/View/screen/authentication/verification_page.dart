import 'package:flutter/material.dart';
import 'package:mas_ring_works/View/screen/authentication/registration_page.dart';
import 'package:mas_ring_works/constants/app_fonts.dart';

import '../../widget/custom_button/custom_button.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "OTP Verification",
              style: AppFont.largeText,
            ),
            SizedBox(height: 10,),
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


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't Receive the code? ",style: AppFont.grayText,),
                TextButton(
                    onPressed: () {},
                    child:  Text(
                        'Resend',
                        style:AppFont.smallText
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: CustomButton(text: "SENT OTP", onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationPage()));
              }),
            ),
          ],
        ),
      ),
    );
  }
}
