import 'package:flutter/material.dart';
import 'package:mas_ring_works/View/screen/staff_details/settlment_alert_box.dart';
import 'package:mas_ring_works/View/widget/custom_button/custom_button.dart';
import 'package:mas_ring_works/View/widget/custom_textfield.dart';
import 'package:mas_ring_works/constants/app_colors.dart';
import 'package:mas_ring_works/constants/app_fonts.dart';
import 'package:mas_ring_works/model/staff_model.dart';
import 'package:mas_ring_works/provider/staff_provider.dart';

class StaffProfilePage extends StatelessWidget {
  final StaffModel staffData;
  final StaffProvider provider;

  const StaffProfilePage(
      {super.key, required this.staffData, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ))
            ],
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
            height: 20,
          ),
          Expanded(
              child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 10),
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
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: CustomButton(
                        text: "Settlement",
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (ctx) => SettlementAlertBox(
                                    staffData: staffData,
                                    staffProvider: provider,
                                  ));
                        }),
                  )
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }
}
