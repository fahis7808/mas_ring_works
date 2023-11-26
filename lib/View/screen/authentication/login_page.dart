import 'package:flutter/material.dart';
import 'package:mas_ring_works/View/screen/inventory/inventory_page.dart';
import 'package:mas_ring_works/View/widget/custom_button/custom_button.dart';
import 'package:mas_ring_works/View/widget/custom_textfield.dart';
import 'package:mas_ring_works/constants/app_fonts.dart';

import 'mobile_number_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 8),
            const CustomTextField(
              value: "Fahis up",
              text: "Username",
            ),
            Spacer(
              flex: 1,
            ),
            // const SizedBox(height: 40,),
            const CustomTextField(
              value: "111111",
              text: "Password",
              isPassWord: true,
            ),
            Spacer(
              flex: 3,
            ),
            // const SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: CustomButton(
                  text: "LOGIN",
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => InventoryPage()));
                  }),
            ),
            // SizedBox(height: 20,),
            Spacer(
              flex: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: AppFont.grayText,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const MobileNumberPage()));
                    },
                    child: Text('Sign up', style: AppFont.smallText)),
              ],
            ),
            Spacer(
              flex: 6,
            )
          ],
        ),
      ),
    );
  }
}
