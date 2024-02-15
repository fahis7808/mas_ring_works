import 'package:flutter/material.dart';
import 'package:mas_ring_works/View/screen/widget/custom_card.dart';
import 'package:mas_ring_works/View/widget/custom_app_bar.dart';
import 'package:mas_ring_works/provider/payment_provider.dart';
import 'package:mas_ring_works/util/snack_bar.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../../widget/custom_button/custom_button.dart';
import '../../widget/custom_dropdown_field.dart';
import '../../widget/custom_textfield.dart';

class AddAdvancePayment extends StatelessWidget {
  const AddAdvancePayment({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => PaymentProvider(),
      child: Consumer<PaymentProvider>(builder: (context, data, _) {
        return Scaffold(
          appBar: const CustomAppBar(title: "Add Advance"),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomDropdownField<String>(
                    items:
                        data.staffList.map((e) => e.name.toString()).toList(),
                    onChanged: (val) {
                      data.paymentModel.staffName = val;
                      final selectedStaff =
                          data.staffList.firstWhere((e) => e.name == val);
                      data.paymentModel.staffId = selectedStaff.id;
                      data.paymentModel.staffNumber = selectedStaff.phoneNumber;
                      // data.paymentModel.balance = selectedStaff.balanceSalary?.toDouble();
                      data.onRefresh();
                    },
                    value: data.paymentModel.staffName,
                    labelText: "Select Staff",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    value: data.paymentModel.staffNumber,
                    labelText: "Mobile Number",
                    onChanged: (val) {
                      data.paymentModel.staffNumber = val;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomCard(
                      child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            CustomTextField(
                              value: data.paymentModel.date,
                              labelText: "Date",
                              onChanged: (val) {
                                data.paymentModel.date = val;
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextField(
                              value: data.paymentModel.reason,
                              labelText: "Reason",
                              onChanged: (val) {
                                data.paymentModel.reason = val;
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: CustomTextField(
                                    readOnly: true,
                                    value:
                                        data.paymentModel.balance?.toString() ??
                                            "0",
                                    labelText: "Balance",
                                    onChanged: (val) {},
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: CustomTextField(
                                    value: data.paymentModel.advanceAmount
                                            ?.toString() ??
                                        "",
                                    labelText: "Advance",
                                    onChanged: (val) {
                                      data.paymentModel.advanceAmount =
                                          val.toDouble();
                                    },
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: CustomButton(
                        text: "ADD",
                        onTap: () {
                          // data.getStaffList();
                          data.saveData().then((value) {
                            if (value == "Success") {
                              Navigator.pop(context);
                            } else {
                              showSnackBar(context, "Something went wrong");
                            }
                          });
                        }),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
