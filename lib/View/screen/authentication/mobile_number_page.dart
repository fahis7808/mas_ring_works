import 'package:flutter/material.dart';
import 'package:mas_ring_works/View/screen/authentication/verification_page.dart';
import 'package:mas_ring_works/View/widget/custom_textfield.dart';
import 'package:mas_ring_works/constants/app_fonts.dart';

import '../../widget/custom_button/custom_button.dart';

class MobileNumberPage extends StatelessWidget {
  const MobileNumberPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 8,),
            Text(
              "Enter Your Mobile\n Number",
              style: AppFont.largeText,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10,),
            Text(
              "We will send you a text verification code",
              style: AppFont.grayText,
            ),
            Spacer(flex: 3,),
            CustomTextField(value: "",text: "Mobile Number",),
            Spacer(flex: 3,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: CustomButton(text: "SENT OTP", onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => VerificationPage()));
              }),
            ),
            Spacer(flex: 1,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account? ",style: AppFont.grayText,),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const MobileNumberPage()));
                    },
                    child:  Text(
                        'Login',
                        style:AppFont.smallText
                    )),
              ],
            ),
            Spacer(flex: 7,),
          ],
        ),
      ),
    );
  }
}
