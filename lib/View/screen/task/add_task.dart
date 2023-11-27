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
      appBar: const CustomAppBar(title: "Add Task"),
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
              const SizedBox(
                height: 8,
              ),
              CustomTextField(
                value: "",
                labelText: "Customer Mobile",
                onChanged: (val) {},
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTextField(
                value: "",
                labelText: "Site Name",
                onChanged: (val) {},
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTextField(
                value: "",
                labelText: "Location",
                onChanged: (val) {},
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTextField(
                value: "",
                labelText: "Work Date",
                onChanged: (val) {},
              ),
              const SizedBox(
                height: 8,
              ),
              CustomDropdownField<String>(
                items: [],
                onChanged: (val) {},
                value: "",
                labelText: "Select Item",
              ),
              const SizedBox(
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
                  const SizedBox(
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
              const SizedBox(
                height: 8,
              ),
              CustomDropdownField<String>(
                items: [],
                onChanged: (val) {},
                value: "",
                labelText: "Select Vehicle",
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
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
                            shape: const StadiumBorder(),
                          ),InputChip(
                            label: Text(
                              "Fahis",
                              style: AppFont.statusColor,
                            ),
                            backgroundColor: AppColors.cardColor,
                            onDeleted: () {},
                            deleteIconColor: AppColors.primaryColor,
                            shape: const StadiumBorder(),
                          ),InputChip(
                            label: Text(
                              "Fahis",
                              style: AppFont.statusColor,
                            ),
                            backgroundColor: AppColors.cardColor,
                            onDeleted: () {},
                            deleteIconColor: AppColors.primaryColor,
                            shape: const StadiumBorder(),
                          ),InputChip(
                            label: Text(
                              "Fahis",
                              style: AppFont.statusColor,
                            ),
                            backgroundColor: AppColors.cardColor,
                            onDeleted: () {},
                            deleteIconColor: AppColors.primaryColor,
                            shape: const StadiumBorder(),
                          ),InputChip(
                            label: Text(
                              "Fahis",
                              style: AppFont.statusColor,
                            ),
                            backgroundColor: AppColors.cardColor,
                            onDeleted: () {},
                            deleteIconColor: AppColors.primaryColor,
                            shape: const StadiumBorder(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
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
