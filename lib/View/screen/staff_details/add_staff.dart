import 'package:flutter/material.dart';
import 'package:mas_ring_works/View/widget/circular_progress_indicator.dart';
import 'package:mas_ring_works/View/widget/custom_app_bar.dart';
import 'package:mas_ring_works/View/widget/custom_dropdown_field.dart';
import 'package:mas_ring_works/View/widget/custom_textfield.dart';
import 'package:mas_ring_works/constants/app_colors.dart';
import 'package:mas_ring_works/constants/app_fonts.dart';
import 'package:mas_ring_works/provider/staff_provider.dart';
import 'package:mas_ring_works/util/snack_bar.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../../widget/custom_button/custom_button.dart';

class RegisterStaff extends StatelessWidget {
  const RegisterStaff({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Register Staff"),
      body: ChangeNotifierProvider(
        create: (ctx) => StaffProvider(),
        child: Consumer<StaffProvider>(builder: (context, data, _) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 75,
                    backgroundColor: AppColors.cardColor,
                    child: Icon(
                      Icons.person,
                      size: 90,
                      color: AppColors.gray,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    value: data.staffModel.name,
                    labelText: "Name",
                    onChanged: (val) {
                      data.staffModel.name = val;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    value: data.staffModel.phoneNumber,
                    labelText: "Mobile Number",
                    onChanged: (val) {
                      data.staffModel.phoneNumber = val;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    value: data.staffModel.email,
                    labelText: "E mail",
                    onChanged: (val) {
                      data.staffModel.email = val;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomDropdownField<String>(
                    items: ["Ring Maker", "Loading", "Ring Fitting"],
                    onChanged: (val) {
                      data.staffModel.jobType = val;
                    },
                    value: data.staffModel.jobType,
                    labelText: "Job Type",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: CustomTextField(
                        value: data.staffModel.salary?.toString() ?? "",
                        labelText: "Basic Salary",
                        onChanged: (val) {
                          data.staffModel.salary = val.toDouble();
                        },
                      )),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: CustomDropdownField<String>(
                          items: [
                            "Daily Wage",
                            "Monthly Wage",
                          ],
                          onChanged: (val) {
                            data.staffModel.salaryType = val;
                          },
                          value: data.staffModel.salaryType,
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
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: CustomTextField(
                                  value: data.staffModel.overTimeHour
                                          ?.toString() ??
                                      "",
                                  labelText: "Hour",
                                  onChanged: (val) {
                                    data.staffModel.overTimeHour =
                                        val.toDouble();
                                  },
                                )),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: CustomTextField(
                                  value: data.staffModel.overTimeWage
                                          ?.toString() ??
                                      "",
                                  labelText: "Wage",
                                  onChanged: (val) {
                                    data.staffModel.overTimeWage =
                                        val.toDouble();
                                  },
                                )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: CustomButton(
                        widget:
                            data.isLoading ? CustomCircularProgressIndicator(isButton: true,) : null,
                        text: "ADD STAFF",
                        onTap: () {
                          if(!data.isLoading){
                            data.saveData().then((value) {
                            if (value == "Success") {
                              Navigator.pop(context);
                            } else {
                              showSnackBar(context, "Something went wrong");
                            }
                          });
                          }
                        }),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
