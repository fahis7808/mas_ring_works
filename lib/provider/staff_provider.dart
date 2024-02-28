import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:mas_ring_works/model/staff_model.dart';
import 'package:mas_ring_works/service/firebase_service.dart';

import '../model/payment_model.dart';

class StaffProvider extends ChangeNotifier {
  StaffModel staffModel = StaffModel();
  List<StaffModel> staffList = [];
  String collectionName = "Staff Details";
  String? prevDocId;
  TextEditingController dateController = TextEditingController();

  bool isLoading = true;
  bool isButtonLoading = false;

  String? date = DateFormat('dd-MM-yyyy').format(DateTime.now());

  StaffProvider() {
    _init();
  }

  DateTime getLastSaturday(DateTime date) {
    return date.subtract(Duration(days: date.weekday % 7));
  }

  DateTime getFriday(DateTime date) {
    int daysUntilFriday = DateTime.friday - date.weekday;
    if (daysUntilFriday <= 0) daysUntilFriday += 7;
    return date.add(Duration(days: daysUntilFriday));
  }

  Map<String, dynamic> getStaffWorkDaysAndSalary(int? staffId) {
    DateTime today = DateTime.now();
    DateTime lastSaturday = getLastSaturday(today);
    DateTime nextFriday = getFriday(today);

    int workDaysCount = 0;
    double weeklySalary = 0.0;

    Set<String> seenDates = Set<String>();

    StaffModel? staff = staffList.firstWhere((staff) => staff.id == staffId,
        orElse: () => StaffModel());

    List<StaffTaskModel>? tasks = staff.taskList;
    if (tasks != null) {
      for (StaffTaskModel task in tasks) {
      if (task.workSalary != null) {
        weeklySalary += task.workSalary!;
      }
      String formattedDate = task.workDate!.split('-').reversed.join('-');
          if (!seenDates.contains(formattedDate)) {
            seenDates.add(formattedDate);
            DateTime taskDate = DateTime.parse(formattedDate);
            if (taskDate.isAfter(lastSaturday) &&
                taskDate.isBefore(nextFriday)) {
              workDaysCount++;

            }
          }
      }
    }
    return {
      'workDaysCount': workDaysCount,
      'weeklySalary': weeklySalary,
    };
  }


  Future<void> _init() async {
    await getDataFromFireStore();
    await getPreviousDocId();
    isLoading = false;
    notifyListeners();
  }

  Future<void> getDataFromFireStore() async {
    isLoading = true;
    notifyListeners();
    try {
      List<Map<String, dynamic>> list =
          await FirebaseService.getDataFromFireStore(collectionName);
      staffList = list.map((data) => StaffModel.fromMap(data)).toList();
      print(staffList.map((e) => e.taskList?.map((e) => e.workDate)));
    } catch (e) {
      // Handle errors
      print("Error fetching data: $e");
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
        prevDocId = "1001";
        print(prevDocId);
      } else {
        prevDocId = (int.parse(prevDocId!) + 1).toString();
      }
      staffModel.id = int.parse(prevDocId!); // Convert to int properly
      final response = await FirebaseService.saveUserDataToFirebase(
          prevDocId!, collectionName, staffModel.toMap());
      isButtonLoading = false;
      notifyListeners();
      return response;
    } catch (e) {
      isButtonLoading = false;
      notifyListeners();
      print("Error saving data: $e");
      return "Error";
    }
  }

  Future<String> deleteData(String docId) async {
    var response =
        await FirebaseService.deleteDataFromFirebase(docId, collectionName);
    return response;
  }

  Future<void> getPreviousDocId() async {
    try {
      prevDocId = await FirebaseService.getDocId(collectionName);
      notifyListeners();
    } catch (e) {
      // Handle errors
      print("Error getting previous doc ID: $e");
    }
  }

  Future<String> savePayment(StaffModel staffData) async {
    PaymentModelList paymentModeList = PaymentModelList(
        date: date,
        amount: staffData.balanceSalary,
        reason: "Weekly Settlement");
    staffData.balanceSalary = 0;

    staffData.paymentList?.add(paymentModeList);
    final response = await FirebaseService.saveUserDataToFirebase(
        staffData.id.toString(), "Staff Details", staffData.toMap());
    print(staffData.toMap());
    return response;
    // return "";
  }

  /// add salary

  String salaryDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
  double? salary;

  addSalary(StaffModel staffData) async {
    int id = staffData.taskList!.isEmpty
        ? 0001
        : (staffData.taskList?.last.id ?? 0) + 1;
    StaffTaskModel taskModel = StaffTaskModel(
      id: id,
      tripId: 0,
      workDate: salaryDate,
      workSalary: salary,
    );

    staffData.totalSalary = (staffModel.totalSalary ?? 0) + (salary ?? 0);
    staffData.balanceSalary = (staffModel.balanceSalary ?? 0) + (salary ?? 0);
    staffData.taskList?.add(taskModel);
    final response = await FirebaseService.saveUserDataToFirebase(
        staffData.id.toString(), "Staff Details", staffData.toMap());
    salary =0;
    return response;
  }
}
