import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mas_ring_works/View/widget/custom_app_bar.dart';
import 'package:mas_ring_works/View/widget/custom_date_field.dart';
import 'package:mas_ring_works/View/widget/custom_dropdown_field.dart';
import 'package:mas_ring_works/View/widget/custom_textfield.dart';
import 'package:mas_ring_works/constants/app_colors.dart';
import 'package:mas_ring_works/constants/app_fonts.dart';
import 'package:mas_ring_works/model/staff_model.dart';
import 'package:mas_ring_works/model/task_model.dart';
import 'package:mas_ring_works/provider/task_provider.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../../../util/snack_bar.dart';
import '../../widget/circular_progress_indicator.dart';
import '../../widget/custom_button/custom_button.dart';

class AddTask extends StatelessWidget {
  final bool isEdit;
  final TaskModel? taskData;

  const AddTask({super.key, this.taskData, this.isEdit = false});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => TaskProvider(),
      child: Consumer<TaskProvider>(builder: (context, data, _) {
        List<StaffModel> staffData =
            isEdit ? taskData?.staffData ?? [] : data.taskModel.staffData ?? [];
        return Scaffold(
          appBar: const CustomAppBar(title: "Add Task"),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  CustomTextField(
                    value:
                        taskData?.customerName ?? data.taskModel.customerName,
                    labelText: "Customer",
                    onChanged: (val) {
                      data.taskModel.customerName = val;
                      taskData?.customerName = val;
                      data.onRefresh();
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextField(
                    keyboardType: TextInputType.phone,
                    value: taskData?.customerMobile ??
                        data.taskModel.customerMobile,
                    labelText: "Customer Mobile",
                    onChanged: (val) {
                      data.taskModel.customerMobile = val;
                      taskData?.customerMobile = val;
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextField(
                    value: taskData?.location ?? data.taskModel.location,
                    labelText: "Location",
                    onChanged: (val) {
                      data.taskModel.location = val;
                      taskData?.location = val;
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextField(
                    value: taskData?.taskName ??
                        "Trip_title_${DateFormat('dd/MM/yy').format(DateTime.now())}",
                    labelText: "Task Name",
                    onChanged: (val) {
                      data.taskModel.taskName = val;
                      taskData?.taskName = val;
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  DatePicker(
                    fieldLabelText: "Work Date",
                    initialDate: DateTime.now(),
                    value: DateTime.now(),
                    controller: data.dateController,
                    onChanged: (val) {
                      data.taskModel.workDate = val;
                      taskData?.workDate = val;
                    },
                    onDateChanged: (val) {
                      if (val != null) {
                        String formattedDate =
                            DateFormat('dd-MM-yyyy').format(val);
                        data.taskModel.workDate = formattedDate;
                        taskData?.workDate = formattedDate;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomDropdownField<String>(
                    items: data.itemList
                        .map((e) => e.itemName.toString())
                        .toList(),
                    onChanged: (val) {
                      data.taskModel.item = val;
                      taskData?.item = val;
                    },
                    value: taskData?.item ?? data.taskModel.item,
                    labelText: "Select Item",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: CustomTextField(
                        keyboardType: TextInputType.number,
                        value: taskData?.unit.toString() ??
                            data.taskModel.unit?.toString() ??
                            "",
                        labelText: "Unit",
                        onChanged: (val) {
                          taskData?.unit = val.toDouble();
                          data.taskModel.unit = val.toDouble();
                        },
                      )),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                          child: CustomTextField(
                        keyboardType: TextInputType.number,
                        value: taskData?.amount.toString() ??
                            data.taskModel.amount?.toString() ??
                            "",
                        labelText: "Amount",
                        onChanged: (val) {
                          taskData?.amount = val.toDouble();
                          data.taskModel.amount = val.toDouble();
                        },
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomDropdownField<String>(
                    items: data.vehicleList
                        .map((e) => e.vehicleNumber.toString())
                        .toList(),
                    onChanged: (val) {
                      data.selectedVehicle = data.vehicleList.firstWhere(
                          (element) => element.vehicleNumber == val);
                      taskData?.vehicleNumber = val;
                    },
                    value:
                        taskData?.vehicleNumber ?? data.taskModel.vehicleNumber,
                    labelText: "Select Vehicle",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        color: AppColors.cardColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Select Staff",
                          style: AppFont.cardText,
                        ),
                        CustomDropdownField<String>(
                          items: data.staffList
                              .map((e) => e.name.toString())
                              .toList(),
                          onChanged: (val) {
                            final selectedStaff = data.staffList.firstWhere(
                                (e) => e.name == val,
                                orElse: () => StaffModel());
                            if (!isEdit) {
                              data.addStaff(selectedStaff);
                            } else {
                              data.addEditStaff(
                                  selectedStaff, taskData?.staffData);
                            }
                          },
                          value: "",
                          labelText: "Select Staff",
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 5),
                          child: Wrap(
                            spacing: 10,
                            runSpacing: 5,
                            children: [
                              for (StaffModel staff in staffData ?? [])
                                InputChip(
                                  label: Text(
                                    staff.name.toString(),
                                    style: AppFont.statusColor,
                                  ),
                                  backgroundColor: AppColors.cardColor,
                                  onDeleted: () {
                                    if (isEdit) {
                                      taskData?.staffData?.remove(staff);
                                      data.onRefresh();
                                    } else {
                                      data.taskModel.staffData?.remove(staff);
                                      data.onRefresh();
                                    }
                                  },
                                  deleteIconColor: AppColors.primaryColor,
                                  shape: const StadiumBorder(),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: CustomButton(
                        widget: data.isButtonLoading
                            ? CustomCircularProgressIndicator(
                                isButton: true,
                              )
                            : null,
                        text: "ADD STAFF",
                        onTap: () {
                          if (isEdit) {
                            data.editData(taskData!).then((value) {
                              if (value == "Success") {
                                Navigator.pop(context);
                              } else {
                                showSnackBar(context, "Something went wrong");
                              }
                            });
                          } else {
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
          ),
        );
      }),
    );
  }
}
