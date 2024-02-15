import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mas_ring_works/model/payment_model.dart';

import '../model/staff_model.dart';
import '../service/firebase_service.dart';

class PaymentProvider extends ChangeNotifier {
  PaymentModel paymentModel = PaymentModel();
  List<PaymentModel> paymentList = [];
  List<StaffModel> staffList = [];

  StaffModel staffModel = StaffModel();

  String collectionName = "Payment Details";
  String? prevDocId;
  TextEditingController dateController = TextEditingController();

  PaymentProvider() {
    getDataFromFireStore();
    getStaffList();
    getPreviousDocId();
  }

  onRefresh() {
    notifyListeners();
  }

  Future<void> getDataFromFireStore() async {
    List<Map<String, dynamic>> list =
        await FirebaseService.getDataFromFireStore(collectionName);
    paymentList = list.map((data) => PaymentModel.fromMap(data)).toList();
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
      prevDocId = "1001";
      print(prevDocId);
    } else {
      prevDocId = (int.parse(prevDocId!) + 1).toString();
    }

    staffModel.balanceSalary =
        (staffModel.balanceSalary ?? 0) - (paymentModel.advanceAmount ?? 0);
    await FirebaseService.saveUserDataToFirebase(
        staffModel.id.toString(), "Staff Details", staffModel.toMap());
    paymentModel.date =
        paymentModel.date ?? DateFormat('dd-MM-yyyy').format(DateTime.now());
    paymentModel.balance = staffModel.balanceSalary;
    final response = await FirebaseService.saveUserDataToFirebase(
        prevDocId!, collectionName, paymentModel.toMap());
    return response;
    // return "";
  }

  // saveStaffData() async{
  //
  //   staffModel.balanceSalary = (staffModel.balanceSalary ?? 0) - (paymentModel.advanceAmount ?? 0);
  //    await FirebaseService.saveUserDataToFirebase(
  //       staffModel.id.toString(), "Staff Details", staffModel.toMap());
  // }

  Future<void> getPreviousDocId() async {
    prevDocId = await FirebaseService.getDocId(collectionName);
    notifyListeners();
  }
}
