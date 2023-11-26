import 'package:flutter/material.dart';
import 'package:mas_ring_works/View/widget/custom_app_bar.dart';
import 'package:mas_ring_works/View/widget/custom_dropdown_field.dart';

import '../../../constants/app_colors.dart';
import '../../widget/custom_button/custom_button.dart';
import '../../widget/custom_textfield.dart';

class AddVehicle extends StatelessWidget {
  const AddVehicle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Add Vehicle",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
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
                labelText: "Vehicle Number",
                onChanged: (val) {},
              ),
              SizedBox(
                height: 10,
              ),
              CustomDropdownField<String>(
                items: [],
                onChanged: (val) {},
                value: "",
                labelText: "Vehicle Type",
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                value: "",
                labelText: "Driver Name",
                onChanged: (val) {},
              ),SizedBox(
                height: 10,
              ),
              CustomTextField(
                value: "",
                labelText: "Driver Mobile",
                onChanged: (val) {},
              ),
              SizedBox(
                height: 10,
              ),
              CustomDropdownField<String>(
                items: [""],
                onChanged: (val) {},
                value: "",
                labelText: "Vehicle Usage",
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                value: "",
                labelText: "Maximum Load Capacity",
                onChanged: (val) {},
              ),
              SizedBox(
                height: 40,
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
