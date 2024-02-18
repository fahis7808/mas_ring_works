import 'package:flutter/material.dart';
import 'package:mas_ring_works/View/widget/circular_progress_indicator.dart';
import 'package:mas_ring_works/View/widget/custom_textfield.dart';
import 'package:mas_ring_works/constants/app_colors.dart';
import 'package:mas_ring_works/constants/app_fonts.dart';
import 'package:mas_ring_works/provider/authentication_provider.dart';
import 'package:provider/provider.dart';

import '../../widget/custom_button/custom_button.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => AuthenticationProvider(),
        child: Consumer<AuthenticationProvider>(builder: (context, data, _) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Create an Account  !",
                      style: AppFont.largeText,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Center(
                          child: InkWell(
                        onTap: () {
                          data.selectImage(context);
                        },
                        child: data.image == null
                            ? const CircleAvatar(
                                backgroundColor: AppColors.cardColor,
                                radius: 70,
                                child: Icon(
                                  Icons.person,
                                  color: AppColors.primaryColor,
                                  size: 100,
                                ),
                              )
                            : CircleAvatar(
                                backgroundImage: FileImage(data.image!),
                                radius: 70,
                              ),
                      )),
                    ),
                    CustomTextField(
                      value: data.userData.name,
                      text: "Name",
                      onChanged: (val) {
                        data.userData.name = val;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextField(
                      // readOnly: false,
                      value: data.userData.phoneNumber,
                      text: "Mobile",
                      onChanged: (val) {
                        data.userData.phoneNumber = val;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextField(
                      value: data.userData.email,
                      text: "E mail",
                      onChanged: (val) {
                        data.userData.email = val;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextField(
                      value: data.userData.businessName,
                      text: "Business Name",
                      onChanged: (val) {
                        data.userData.businessName = val;
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: CustomButton(
                          widget: data.isLoaded
                              ? CustomCircularProgressIndicator(
                                  isButton: true,
                                )
                              : null,
                          text: "REGISTER",
                          onTap: () {
                            // print(data.userData.phoneNumber);
                            data.registerData(context);
                          }),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
