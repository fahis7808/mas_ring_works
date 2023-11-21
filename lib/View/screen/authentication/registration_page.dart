import 'package:flutter/material.dart';
import 'package:mas_ring_works/View/screen/authentication/login_page.dart';
import 'package:mas_ring_works/View/widget/custom_textfield.dart';
import 'package:mas_ring_works/constants/app_fonts.dart';

import '../../widget/custom_button/custom_button.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Create an Account  !",style: AppFont.largeText,),
                CustomTextField(value: "",text: "Name",),
                SizedBox(height: 15,),
                CustomTextField(value: "",text: "Mobile",),
                SizedBox(height: 15,),
                CustomTextField(value: "",text: "E mail",),
                SizedBox(height: 15,),
                CustomTextField(value: "",text: "Business Name",),
                SizedBox(height: 15,),
                CustomTextField(value: "",text: "Password",),
                SizedBox(height: 15,),
                CustomTextField(value: "",text: "Confirm Password",),

                SizedBox(height: 40,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: CustomButton(text: "REGISTER", onTap: (){}),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account? ",style: AppFont.grayText,),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const LoginPage()));
                        },
                        child:  Text(
                            'Login',
                            style:AppFont.smallText
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
