import 'package:flutter/material.dart';
import 'package:mas_ring_works/View/widget/custom_button/custom_button.dart';
import 'package:mas_ring_works/View/widget/custom_textfield.dart';
import 'package:mas_ring_works/model/staff_model.dart';
import 'package:mas_ring_works/provider/staff_provider.dart';
import 'package:mas_ring_works/util/snack_bar.dart';


class SettlementAlertBox extends StatelessWidget {
  final StaffModel staffData;
  final StaffProvider staffProvider;

  const SettlementAlertBox(
      {super.key, required this.staffData, required this.staffProvider});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      content: Column(
        children: [
          CustomTextField(
            value: staffProvider.date,
            labelText: "Date",
            onChanged: (val) {
              staffProvider.date = val;
            },
          ),
          const CustomTextField(
            readOnly: true,
            value: "Weekly Settlement",
            labelText: "Reason",
          ),
          CustomTextField(
            readOnly: true,
            value: staffData.balanceSalary.toString(),
            labelText: "Amount",
            // onChanged: (val) {
            //   // staffData.balanceSalary = val.toDouble();
            // },
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
              text: "Paid",
              onTap: () {
                if (staffData.balanceSalary == 0) {
                  showSnackBar(context, ("No Balance for Settlement"));
                } else {
                  staffProvider.savePayment(staffData).then((value) {
                    if (value == "Success") {
                      Navigator.pop(context);
                    } else {
                      showSnackBar(context, "Something went wrong");
                    }
                  });
                }
              })
        ],
      ),
    );
  }
}
