import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/staff_model.dart';
import '../model/task_model.dart';
import '../service/firebase_service.dart';

class DailyBusinessProvider extends ChangeNotifier {
  List<TaskModel> taskList = [];
  List<StaffModel> staffList = [];
  String? date = DateFormat('dd-MM-yyyy').format(DateTime.now());
  bool isLoading = true;
  bool isButtonLoading = false;

  DailyBusinessProvider() {
    _init();
  }

  Future<void> _init() async {
    await getDataFromFireStore();
    await getStaffData();
    isLoading = false;
    notifyListeners();
  }

  Future<void> getDataFromFireStore() async {
    try {
      isLoading = true;
      notifyListeners();
      List<Map<String, dynamic>> list =
      await FirebaseService.getDataFromFireStore("Task Details");
      List<TaskModel> dailyList =
      list.map((data) => TaskModel.fromMap(data)).toList();
      taskList = dailyList.where((element) => element.workDate == date).toList();
    } catch (e) {
      print("Error fetching data: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getStaffData() async {
    try {
      List<Map<String, dynamic>> list =
      await FirebaseService.getDataFromFireStore("Staff Details");
      staffList = list.map((data) => StaffModel.fromMap(data)).toList();
    } catch (e) {
      print("Error fetching staff data: $e");
    } finally {
      notifyListeners();
    }
  }

  Future<String> saveData(TaskModel taskData) async {
    try {
      isButtonLoading = true;
      notifyListeners();

      for (StaffModel staff in taskData.staffData ?? []) {
        StaffModel staffModel = staffList.firstWhere(
              (e) => staff.id == e.id,
          orElse: () => StaffModel(),
        );

        /// Update staff salary and working days
        staffModel.balanceSalary = (staffModel.balanceSalary ?? 0.0) +
            (staffModel.salary ?? 0.0) +
            (taskData.overTimeCharge ?? 0.0);
        staffModel.totalSalary = (staffModel.totalSalary ?? 0.0) +
            (staffModel.salary ?? 0.0) +
            (taskData.overTimeCharge ?? 0.0);
        staffModel.totalWorkingDays = (staffModel.totalWorkingDays ?? 0) + 1;

        /// Update task status
        taskData.status = "Finished";

        /// Save staff data
        await FirebaseService.saveUserDataToFirebase(
            staffModel.id.toString(), "Staff Details", staffModel.toMap());
      }

      /// Save task data
      final response = await FirebaseService.saveUserDataToFirebase(
          taskData.id.toString(), "Task Details", taskData.toMap());

      return response;
    } catch (e) {
      print("Error saving data: $e");
      return "Error";
    } finally {
      isButtonLoading = false;
      notifyListeners();
    }
  }
}
