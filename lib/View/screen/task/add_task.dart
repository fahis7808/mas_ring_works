import 'package:flutter/material.dart';
import 'package:mas_ring_works/View/widget/custom_app_bar.dart';
import 'package:mas_ring_works/View/widget/custom_dropdown_field.dart';
import 'package:mas_ring_works/View/widget/custom_textfield.dart';
import 'package:mas_ring_works/constants/app_colors.dart';
import 'package:mas_ring_works/constants/app_fonts.dart';

import '../../widget/custom_button/custom_button.dart';

class AddTask extends StatelessWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Add Task"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              CustomTextField(
                value: "",
                labelText: "Customer",
                onChanged: (val) {},
              ),
              SizedBox(
                height: 8,
              ),
              CustomTextField(
                value: "",
                labelText: "Customer Mobile",
                onChanged: (val) {},
              ),
              SizedBox(
                height: 8,
              ),
              CustomTextField(
                value: "",
                labelText: "Site Name",
                onChanged: (val) {},
              ),
              SizedBox(
                height: 8,
              ),
              CustomTextField(
                value: "",
                labelText: "Location",
                onChanged: (val) {},
              ),
              SizedBox(
                height: 8,
              ),
              CustomTextField(
                value: "",
                labelText: "Work Date",
                onChanged: (val) {},
              ),
              SizedBox(
                height: 8,
              ),
              CustomDropdownField<String>(
                items: [],
                onChanged: (val) {},
                value: "",
                labelText: "Select Item",
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                      child: CustomTextField(
                    value: "",
                    labelText: "Unite",
                    onChanged: (val) {},
                  )),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                      child: CustomTextField(
                    value: "",
                    labelText: "Amount",
                    onChanged: (val) {},
                  )),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              CustomDropdownField<String>(
                items: [],
                onChanged: (val) {},
                value: "",
                labelText: "Select Vehicle",
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: AppColors.cardColor,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Select Staff",
                      style: AppFont.cardText,
                    ),
                    CustomDropdownField<String>(
                      items: [],
                      onChanged: (val) {},
                      value: "",
                      labelText: "Select Staff",
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                      child: Wrap(
                        spacing: 10,
                        runSpacing: 5,
                        children: [
                          InputChip(
                            label: Text(
                              "Fahis",
                              style: AppFont.statusColor,
                            ),
                            backgroundColor: AppColors.cardColor,
                            onDeleted: () {},
                            deleteIconColor: AppColors.primaryColor,
                            shape: StadiumBorder(),
                          ),InputChip(
                            label: Text(
                              "Fahis",
                              style: AppFont.statusColor,
                            ),
                            backgroundColor: AppColors.cardColor,
                            onDeleted: () {},
                            deleteIconColor: AppColors.primaryColor,
                            shape: StadiumBorder(),
                          ),InputChip(
                            label: Text(
                              "Fahis",
                              style: AppFont.statusColor,
                            ),
                            backgroundColor: AppColors.cardColor,
                            onDeleted: () {},
                            deleteIconColor: AppColors.primaryColor,
                            shape: StadiumBorder(),
                          ),InputChip(
                            label: Text(
                              "Fahis",
                              style: AppFont.statusColor,
                            ),
                            backgroundColor: AppColors.cardColor,
                            onDeleted: () {},
                            deleteIconColor: AppColors.primaryColor,
                            shape: StadiumBorder(),
                          ),InputChip(
                            label: Text(
                              "Fahis",
                              style: AppFont.statusColor,
                            ),
                            backgroundColor: AppColors.cardColor,
                            onDeleted: () {},
                            deleteIconColor: AppColors.primaryColor,
                            shape: StadiumBorder(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
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
