import 'package:flutter/material.dart';
import 'package:mas_ring_works/View/screen/staff_details/add_salary_alert.dart';
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
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ))
            ],
          ),
          const CircleAvatar(
            radius: 65,
            backgroundColor: AppColors.cardColor,
            child: Icon(
              Icons.person,
              size: 80,
              color: AppColors.gray,
            ),
          ),
          Text(
            staffData.name.toString(),
            style: AppFont.whiteLargeText,
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            staffData.email.toString(),
            style: AppFont.buttonText,
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            staffData.phoneNumber.toString(),
            style: AppFont.buttonText,
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
              child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomTextField(
                      readOnly: true,
                      value: staffData.jobType,
                      labelText: "Job Type",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      readOnly: true,
                      value: staffData.salary.toString(),
                      labelText: "Daily Salary",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            readOnly: true,
                            value: staffData.totalWorkingDays?.toString() ?? "",
                            labelText: "Total Working Days",
                          ),
                        ),
                        const SizedBox(width: 10,),
                        Expanded(
                          child: CustomTextField(
                            readOnly: true,
                            value: staffData.totalSalary?.toString() ?? "",
                            labelText: "Total Salary",
                          ),
                        ),

                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            readOnly: true,
                            value: provider.getStaffWorkDaysAndSalary(staffData.id)["workDaysCount"]?.toString() ?? "",
                            labelText: "Weekly WorkDays",
                          ),
                        ),
                        const SizedBox(width: 10,),
                        Expanded(
                          child: CustomTextField(
                            readOnly: true,
                            value: provider.getStaffWorkDaysAndSalary(staffData.id)["weeklySalary"]?.toString() ?? "",
                            labelText: "Weekly Salary",
                          ),
                        ),
                      ],
                    ), const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            readOnly: true,
                            value: staffData.advancePaid?.toString() ?? "",
                            labelText: "Advance Paid",
                          ),
                        ),
                        const SizedBox(width: 10,),
                        Expanded(
                          child: CustomTextField(
                            readOnly: true,
                            value: staffData.balanceSalary.toString(),
                            labelText: "Balance Payment",
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 40),
                    Row(
                      children: [
                        Expanded(
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
                        ),
                        const SizedBox(width: 10,),
                        Expanded(
                          child: CustomButton(
                              text: "Add Salary",
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (ctx) => AddSalaryAlert(
                                          staffData: staffData,
                                          staffProvider: provider,
                                        )).then((value) => provider.getDataFromFireStore());
                              }),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )),
        ],
      ),
    );
  }
}
