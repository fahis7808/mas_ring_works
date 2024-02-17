import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mas_ring_works/model/task_model.dart';
import 'package:mas_ring_works/model/inventory_model.dart';
import 'package:mas_ring_works/model/staff_model.dart';
import 'package:mas_ring_works/model/vehicle_model.dart';
import 'package:mas_ring_works/service/firebase_service.dart';

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
  bool isLoading = true;
  bool isButtonLoading = false;

  TaskProvider() {
    _init();
  }

  Future<void> _init() async {
    await getDataFromFireStore();
    await getStaffList();
    await getItemData();
    await getVehicleData();
    await getPreviousDocId();
    isLoading = false;
    notifyListeners();
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
    isLoading = true;
    notifyListeners();
    List<Map<String, dynamic>> list =
    await FirebaseService.getDataFromFireStore("Vehicle Details");
    vehicleList = list.map((data) => VehicleModel.fromMap(data)).toList();
    print(vehicleList);
    isLoading = false;
    notifyListeners();
  }

  Future<void> getItemData() async {
    isLoading = true;
    notifyListeners();
    List<Map<String, dynamic>> list =
    await FirebaseService.getDataFromFireStore("Item Details");
    itemList = list.map((data) => InventoryModel.fromMap(data)).toList();
    isLoading = false;
    notifyListeners();
  }

  Future<void> getDataFromFireStore() async {
    isLoading = true;
    notifyListeners();
    try {
      List<Map<String, dynamic>> list =
      await FirebaseService.getDataFromFireStore(collectionName);
      taskList = list.map((data) => TaskModel.fromMap(data)).toList();
    } catch (e) {
      print("Error fetching data: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getStaffList() async {
    isLoading = true;
    notifyListeners();
    try {
      List<Map<String, dynamic>> list =
      await FirebaseService.getDataFromFireStore("Staff Details");
      staffList = list.map((data) => StaffModel.fromMap(data)).toList();
      print(staffList);
    } catch (e) {
      print("Error fetching staff list: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<String> saveData() async {
    isButtonLoading = true;
    notifyListeners();
    try {
      if (prevDocId == null || prevDocId == "") {
        prevDocId = "1100";
        print(prevDocId);
      } else {
        prevDocId = (int.parse(prevDocId!) + 1).toString();
      }
      taskModel.driverName = selectedVehicle.driverName;
      taskModel.driverMobile = selectedVehicle.driverNumber;
      taskModel.vehicleNumber = selectedVehicle.vehicleNumber;
      taskModel.workDate =
          DateFormat('dd-MM-yyyy').format(DateTime.now());
      taskModel.taskName =
      "${taskModel.customerName}_${taskModel.location}_${taskModel.workDate}";
      taskModel.id = int.parse(prevDocId!);
      final response = await FirebaseService.saveUserDataToFirebase(
          prevDocId!, collectionName, taskModel.toMap());
      isButtonLoading = false;
      notifyListeners();
      return response;
    } catch (e) {
      print("Error saving data: $e");
      isButtonLoading = false;
      notifyListeners();
      return "Error";
    }
  }

  Future<void> getPreviousDocId() async {
    isLoading = true;
    notifyListeners();
    try {
      prevDocId = await FirebaseService.getDocId(collectionName);
      notifyListeners();
    } catch (e) {
      print("Error getting previous doc ID: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
