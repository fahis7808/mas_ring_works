import 'package:flutter/material.dart';
import 'package:mas_ring_works/View/widget/custom_button/custom_button.dart';
import 'package:mas_ring_works/View/widget/custom_textfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomTextField(value: "Fahis up",text: "Username",),
            const SizedBox(height: 40,),
            const CustomTextField(value: "111111",text: "Password",isPassWord: true,),
            const SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: CustomButton(text: "LOGIN", onTap: (){}),
            )
          ],
        ),
      ),
    );
  }
}
