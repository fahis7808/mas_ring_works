import 'package:flutter/material.dart';

import '../model/staff_model.dart';
import '../model/task_model.dart';
import '../service/firebase_service.dart';

class DailyBusinessProvider extends ChangeNotifier {
  List<TaskModel> taskList = [];

  DailyBusinessProvider() {
    getDataFromFireStore();
  }

  Future<void> getDataFromFireStore() async {
    List<Map<String, dynamic>> list =
        await FirebaseService.getDataFromFireStore("Task Details");
    taskList = list.map((data) => TaskModel.fromMap(data)).toList();
    notifyListeners();
  }

  salaryCalculation() {
    /*  Map<String, double> staffSalaryMap = {};
    for (TaskModel task in taskList) {
      for (StaffModel staff in task.staffData ?? []) {
        double salary = staff.overTimeWage ?? 0.0;
        staff.balanceSalary = (staff.balanceSalary) + salary;
        staffSalaryMap[(staff.id ?? "").toString()] = (staffSalaryMap[(staff.id ?? "").toString()] ?? 0.0) + salary;
      }
    }
    print(staffSalaryMap);*/
  }

  Future<String> saveData(TaskModel taskData) async {
    for (StaffModel staff in taskData.staffData ?? []) {
      staff.balanceSalary = (staff.balanceSalary ?? 0.0) +
          (staff.salary ?? 0.0) +
          (taskData.overTimeCharge ?? 0.0);
      await FirebaseService.saveUserDataToFirebase(
          staff.id.toString(), "Staff Details", staff.toMap());
    }

    final response = await FirebaseService.saveUserDataToFirebase(
        taskData.id.toString(), "Task Details", taskData.toMap());
    return response;
  }
}
