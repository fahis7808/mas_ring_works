import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mas_ring_works/View/widget/custom_button/custom_button.dart';
import 'package:mas_ring_works/View/widget/custom_textfield.dart';
import 'package:mas_ring_works/model/staff_model.dart';
import 'package:mas_ring_works/provider/staff_provider.dart';
import 'package:mas_ring_works/util/snack_bar.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../widget/custom_date_field.dart';

class AddSalaryAlert extends StatelessWidget {
  final StaffModel staffData;
  final StaffProvider staffProvider;

  const AddSalaryAlert(
      {super.key, required this.staffData, required this.staffProvider});

  @override
  Widget build(BuildContext context) {
    // final data = Provider.of<StaffProvider>(context,listen: false);
    return AlertDialog(
      scrollable: true,
      content: SingleChildScrollView(
        child: Column(
          children: [
            DatePicker(
              fieldLabelText: "Work Date",
              initialDate: DateTime.now(),
              value: DateTime.now(),
              controller: staffProvider.dateController,
              onChanged: (val) {
                staffProvider.salaryDate = val;
              },
              onDateChanged: (val) {
                if (val != null) {
                  String formattedDate = DateFormat('dd-MM-yyyy').format(val);
                  staffProvider.salaryDate = formattedDate;
                  // data.paymentModeList.date = formattedDate;
                }
              },
            ),
            CustomTextField(
              value: staffProvider.salary?.toString() ?? "",
              labelText: "Amount",
              onChanged: (val) {
                staffProvider.salary = val.toDouble();
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                    child: CustomButton(
                        text: "Cancel",
                        onTap: () {
                          Navigator.pop(context);
                        })),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: CustomButton(
                      text: "Add Salary",
                      onTap: () {
                        if (staffProvider.salary == 0 || staffProvider.salary == "") {
                          showSnackBar(context, ("Please Enter an Amount"));
                        } else {
                          staffProvider.addSalary(staffData).then((value) {
                            if (value == "Success") {
                              Navigator.pop(context);
                            } else {
                              showSnackBar(context, "Something wenat wrong");
                            }
                          });
                        }
                      }),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
