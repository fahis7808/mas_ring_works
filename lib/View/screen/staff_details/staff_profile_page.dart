import 'package:flutter/material.dart';
import 'package:mas_ring_works/View/widget/custom_textfield.dart';
import 'package:mas_ring_works/constants/app_colors.dart';
import 'package:mas_ring_works/constants/app_fonts.dart';
import 'package:mas_ring_works/model/staff_model.dart';

class StaffProfilePage extends StatelessWidget {
  final StaffModel staffData;

  const StaffProfilePage({super.key, required this.staffData});

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
            staffData.name.toString(),
            style: AppFont.whiteLargeText,
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            staffData.email.toString(),
            style: AppFont.buttonText,
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            staffData.phoneNumber.toString(),
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
                  CustomTextField(
                    readOnly: true,
                    value: staffData.jobType,
                    labelText: "Job Type",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    readOnly: true,
                    value: staffData.salary.toString(),
                    labelText: "Daily Salary",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    readOnly: true,
                    value: staffData.totalWorkingDays?.toString() ?? "",
                    labelText: "Total Working Days",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    readOnly: true,
                    value: staffData.advancePaid?.toString() ?? "",
                    labelText: "Advance Paid",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    readOnly: true,
                    value: staffData.balanceSalary.toString(),
                    labelText: "Balance Payment",
                  ),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
