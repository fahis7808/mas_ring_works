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

  bool isLoading = true;
  bool isButtonLoading = false;

  String? date = DateFormat('dd-MM-yyyy').format(DateTime.now());

  StaffProvider() {
    _init();
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

  Future<String> deleteData(String docId) async{
    var response = await FirebaseService.deleteDataFromFirebase(docId, collectionName);
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
}
