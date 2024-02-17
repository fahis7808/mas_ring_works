import 'package:flutter/material.dart';
import 'package:mas_ring_works/View/screen/widget/custom_card.dart';
import 'package:mas_ring_works/View/widget/circular_progress_indicator.dart';
import 'package:mas_ring_works/View/widget/custom_app_bar.dart';
import 'package:mas_ring_works/model/task_model.dart';
import 'package:mas_ring_works/provider/daily_business_provider.dart';
import 'package:mas_ring_works/util/snack_bar.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_fonts.dart';
import '../../../../model/staff_model.dart';
import '../../../widget/custom_button/custom_button.dart';
import '../../../widget/custom_textfield.dart';

class OnDailyCardTap extends StatelessWidget {
  final TaskModel taskModel;

  const OnDailyCardTap({super.key, required this.taskModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: taskModel.taskName.toString()),
      body: ChangeNotifierProvider(
        create: (ctx) => DailyBusinessProvider(),
        child: Consumer<DailyBusinessProvider>(builder: (context, data, _) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  CustomTextField(
                    readOnly: true,
                    value: taskModel.customerName,
                    labelText: "Customer Name",
                    onChanged: (val) {
                      taskModel.customerName = val;
                    },
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  CustomTextField(
                    readOnly: true,
                    value: taskModel.customerMobile,
                    labelText: "Customer Mobile",
                    onChanged: (val) {
                      taskModel.customerMobile = val;
                    },
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  CustomTextField(
                    readOnly: true,
                    value: taskModel.location,
                    labelText: "Location",
                    onChanged: (val) {
                      taskModel.location = val;
                    },
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          readOnly: true,
                          value: taskModel.item,
                          labelText: "Item",
                          onChanged: (val) {},
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: CustomTextField(
                          readOnly: true,
                          value: taskModel.unit?.toString() ?? "",
                          labelText: "Item Count",
                          onChanged: (val) {},
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          value: taskModel.startTime,
                          labelText: "Start Time",
                          onChanged: (val) {
                            taskModel.startTime = val;
                          },
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: CustomTextField(
                          value: taskModel.endTime,
                          labelText: "End Time",
                          onChanged: (val) {
                            taskModel.endTime = val;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          value: taskModel.overTime,
                          labelText: "Over Time",
                          onChanged: (val) {
                            taskModel.overTime = val;
                          },
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: CustomTextField(
                          keyboardType: TextInputType.number,
                          value: taskModel.overTimeCharge?.toString() ?? "",
                          labelText: "Charge",
                          onChanged: (val) {
                            taskModel.overTimeCharge = val.toDouble();
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  CustomTextField(
                    readOnly: true,
                    value: taskModel.vehicleNumber,
                    labelText: "Vehicle Number",
                    onChanged: (val) {},
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  CustomTextField(
                    readOnly: true,
                    value: taskModel.driverName,
                    labelText: "Driver Name",
                    onChanged: (val) {},
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  CustomTextField(
                    readOnly: true,
                    value: taskModel.driverMobile,
                    labelText: "Driver Mobile",
                    onChanged: (val) {},
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  CustomCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Site Workers",
                                style: AppFont.cardText,
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Wrap(
                              spacing: 10,
                              runSpacing: 5,
                              children: [
                                for (StaffModel staff in taskModel.staffData ??
                                    [])
                                  InputChip(
                                    label: Text(
                                      staff.name.toString(),
                                      style: AppFont.statusColor,
                                    ),
                                    backgroundColor: AppColors.cardColor,
                                    onDeleted: () {},
                                    deleteIconColor: AppColors.primaryColor,
                                    shape: const StadiumBorder(),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: CustomButton(
                        widget: data.isButtonLoading
                            ? CustomCircularProgressIndicator(isButton: true,)
                            :null,
                        text: "WORK FINISHED",
                        onTap: () {
                          data.saveData(taskModel).then((value) {
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
          );
        }),
      ),
    );
  }
}
