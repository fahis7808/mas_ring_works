import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mas_ring_works/View/screen/widget/custom_card.dart';
import 'package:mas_ring_works/View/widget/custom_app_bar.dart';
import 'package:mas_ring_works/provider/payment_provider.dart';
import 'package:mas_ring_works/util/snack_bar.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../../widget/circular_progress_indicator.dart';
import '../../widget/custom_button/custom_button.dart';
import '../../widget/custom_date_field.dart';
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
                      data.staffModel =
                          data.staffList.firstWhere((e) => e.name == val);
                      data.onRefresh();
                    },
                    value: data.staffModel.name,
                    labelText: "Select Staff",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    readOnly: true,
                    value: data.staffModel.phoneNumber,
                    labelText: "Mobile Number",
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
                            DatePicker(
                              fieldLabelText: "Work Date",
                              initialDate: DateTime.now(),
                              value: DateTime.now(),
                              controller: data.dateController,
                              onChanged: (val) {
                                data.paymentModeList.date = val;
                              },
                              onDateChanged: (val) {
                                if (val != null) {
                                  String formattedDate =
                                      DateFormat('dd-MM-yyyy').format(val);
                                  data.paymentModeList.date = formattedDate;
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextField(
                              value: data.paymentModeList.reason,
                              labelText: "Reason",
                              onChanged: (val) {
                                data.paymentModeList.reason = val;
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
                                    value: data.staffModel.balanceSalary
                                            ?.toString() ??
                                        "0",
                                    labelText: "Balance",
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: CustomTextField(
                                    value: data.paymentModeList.amount
                                            ?.toString() ??
                                        "",
                                    labelText: "Advance",
                                    onChanged: (val) {
                                      data.paymentModeList.amount =
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
                        widget: data.isButtonLoading
                            ? CustomCircularProgressIndicator(
                                isButton: true,
                              )
                            : null,
                        text: "ADD",
                        onTap: () {
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
