import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mas_ring_works/model/task_model.dart';
import 'package:nb_utils/nb_utils.dart';

import '../model/inventory_model.dart';
import '../model/staff_model.dart';
import '../model/vehicle_model.dart';
import '../service/firebase_service.dart';

class TaskProvider extends ChangeNotifier {
  TaskModel taskModel = TaskModel();
  List<TaskModel> taskList = [];
  List<StaffModel> staffList = [];
  List<InventoryModel> itemList = [];
  List<VehicleModel> vehicleList = [];
  VehicleModel selectedVehicle = VehicleModel();

  String collectionName = "Task Details";
  String? prevDocId;
  TextEditingController dateController = TextEditingController();

  TaskProvider() {
    getDataFromFireStore();
    getStaffList();
    getItemData();
    getVehicleData();
    getPreviousDocId();
  }

  onRefresh() {
    notifyListeners();
  }

  void addStaff(StaffModel staff) {
    taskModel.staffData ??= [];
    if (!taskModel.staffData!.contains(staff)) {
      taskModel.staffData!.add(staff);
      notifyListeners();
    }
  }

  Future<void> getVehicleData() async {
    List<Map<String, dynamic>> list =
        await FirebaseService.getDataFromFireStore("Vehicle Details");
    vehicleList = list.map((data) => VehicleModel.fromMap(data)).toList();
    print(vehicleList);
    notifyListeners();
  }

  Future<void> getItemData() async {
    List<Map<String, dynamic>> list =
        await FirebaseService.getDataFromFireStore("Item Details");
    itemList = list.map((data) => InventoryModel.fromMap(data)).toList();
    notifyListeners();
  }

  Future<void> getDataFromFireStore() async {
    List<Map<String, dynamic>> list =
        await FirebaseService.getDataFromFireStore(collectionName);
    taskList = list.map((data) => TaskModel.fromMap(data)).toList();
    notifyListeners();
  }

  Future<void> getStaffList() async {
    List<Map<String, dynamic>> list =
        await FirebaseService.getDataFromFireStore("Staff Details");
    staffList = list.map((data) => StaffModel.fromMap(data)).toList();
    print(staffList);
    notifyListeners();
  }

  Future<String> saveData() async {
    if (prevDocId == null || prevDocId == "") {
      prevDocId = "1100";
      print(prevDocId);
    } else {
      prevDocId = (int.parse(prevDocId!) + 1).toString();
    }
    taskModel.driverMobile = selectedVehicle.driverNumber;
    taskModel.vehicleNumber = selectedVehicle.vehicleNumber;
    taskModel.workDate = taskModel.workDate ?? DateFormat('dd-MM-yyyy').format(DateTime.now());
    taskModel.taskName =
        "${taskModel.customerName}_${taskModel.siteName}_${taskModel.workDate}";
    taskModel.id = prevDocId.toInt();
    final response = await FirebaseService.saveUserDataToFirebase(
        prevDocId!, collectionName, taskModel.toMap());
    return response;
  }

  Future<void> getPreviousDocId() async {
    prevDocId = await FirebaseService.getDocId(collectionName);
    notifyListeners();
  }
}
