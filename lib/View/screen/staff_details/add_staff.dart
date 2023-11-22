import 'package:flutter/material.dart';
import 'package:mas_ring_works/View/widget/custom_app_bar.dart';
import 'package:mas_ring_works/View/widget/custom_dropdown_field.dart';
import 'package:mas_ring_works/View/widget/custom_textfield.dart';
import 'package:mas_ring_works/constants/app_colors.dart';
import 'package:mas_ring_works/constants/app_fonts.dart';

import '../../widget/custom_button/custom_button.dart';

class RegisterStaff extends StatelessWidget {
  const RegisterStaff({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Register Staff"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CircleAvatar(
                child: Icon(
                  Icons.person,
                  size: 90,
                  color: AppColors.gray,
                ),
                radius: 75,
                backgroundColor: AppColors.cardColor,
              ),
              SizedBox(
                height: 15,
              ),
              CustomTextField(
                value: "",
                labelText: "Name",
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                value: "",
                labelText: "Mobile Number",
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                value: "",
                labelText: "E mail",
              ),
              SizedBox(
                height: 10,
              ),
              CustomDropdownField<String>(
                items: [],
                onChanged: (val) {},
                value: "",
                labelText: "Job Type",
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                      child: CustomTextField(
                    value: "",
                    labelText: "Basic Salary",
                  )),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CustomDropdownField<String>(
                      items: [],
                      onChanged: (val) {},
                      value: "",
                      labelText: "Salary Type",
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Overtime wage",
                          style: AppFont.cardText,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: CustomTextField(
                              value: "",
                              labelText: "Hour",
                            )),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: CustomTextField(
                              value: "",
                              labelText: "Wage",
                            )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: CustomButton(text: "ADD STAFF", onTap: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
