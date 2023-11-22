import 'package:flutter/material.dart';
import 'package:mas_ring_works/View/widget/custom_textfield.dart';
import 'package:mas_ring_works/constants/app_colors.dart';
import 'package:mas_ring_works/constants/app_fonts.dart';

class StaffProfilePage extends StatelessWidget {
  const StaffProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
          ),
          CircleAvatar(
            child: Icon(
              Icons.person,
              size: 90,
              color: AppColors.gray,
            ),
            radius: 75,
            backgroundColor: AppColors.cardColor,
          ),
          Text(
            "Aboobacker Fahise",
            style: AppFont.whiteLargeText,
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            "fahis369@gmail.com",
            style: AppFont.buttonText,
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            "8893288945",
            style: AppFont.buttonText,
          ),
          SizedBox(
            height: 35,
          ),
          Expanded(
              child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 35, 20, 10),
              child: Column(
                children: [
                  CustomTextField(value: "",labelText: "Job Type",),
                  SizedBox(height: 10,),
                  CustomTextField(value: "",labelText: "Daily Salary",),
                  SizedBox(height: 10,),
                  CustomTextField(value: "",labelText: "Total Working Days",),
                  SizedBox(height: 10,),
                  CustomTextField(value: "",labelText: "Advance Paid",),
                  SizedBox(height: 10,),
                  CustomTextField(value: "",labelText: "Balance Payment",),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
