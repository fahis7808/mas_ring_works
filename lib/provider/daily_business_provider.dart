import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/staff_model.dart';
import '../model/task_model.dart';
import '../service/firebase_service.dart';

class DailyBusinessProvider extends ChangeNotifier {
  List<TaskModel> taskList = [];
  String? date = DateFormat('dd-MM-yyyy').format(DateTime.now());

  DailyBusinessProvider() {
    getDataFromFireStore();
    getStaffData();
  }

  Future<void> getDataFromFireStore() async {
    List<Map<String, dynamic>> list =
        await FirebaseService.getDataFromFireStore("Task Details");

    List<TaskModel> dailyList = list.map((data) => TaskModel.fromMap(data)).toList();
  print(dailyList.map((e) => e.workDate));
   taskList = dailyList.where((element) => element.workDate == date).toList();

  print(taskList);
  notifyListeners();
  }

  Future<void> getStaffData() async {
    List<Map<String, dynamic>> list =
        await FirebaseService.getDataFromFireStore("Staff Details");
    staffList = list.map((data) => StaffModel.fromMap(data)).toList();
    notifyListeners();
  }

  List<StaffModel> staffList = [];

  Future<String> saveData(TaskModel taskData) async {
    for (StaffModel staff in taskData.staffData ?? []) {
      StaffModel staffModel = staffList.firstWhere((e) => staff.id == e.id,
          orElse: () =>
              StaffModel());
      print("Staff Name: ${staff.name}");
      print("Staff Model Name: ${staffModel.name}");

      /// balanceSalary
      staffModel.balanceSalary = (staffModel.balanceSalary ?? 0.0) +
          (staffModel.salary ?? 0.0) +
          (taskData.overTimeCharge ?? 0.0);

      /// total salary
      staffModel.totalSalary = (staffModel.totalSalary ?? 0.0) +
          (staffModel.salary ?? 0.0) +
          (taskData.overTimeCharge ?? 0.0);

      /// total Working Days
      staffModel.totalWorkingDays = (staffModel.totalWorkingDays?? 0.0) +1;

      taskData.status = "Finished";

      await FirebaseService.saveUserDataToFirebase(
          staffModel.id.toString(), "Staff Details", staffModel.toMap());
    }

    // print(taskData.toMap());
    final response = await FirebaseService.saveUserDataToFirebase(
        taskData.id.toString(), "Task Details", taskData.toMap());
    return response;
    // return "";
  }
}
