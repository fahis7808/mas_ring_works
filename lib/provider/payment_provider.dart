import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mas_ring_works/model/payment_model.dart';

import '../model/staff_model.dart';
import '../service/firebase_service.dart';

class PaymentProvider extends ChangeNotifier {
  List<StaffModel> paymentList = [];
  List<StaffModel> staffList = [];

  StaffModel staffModel = StaffModel();

  String collectionName = "Payment Details";
  String? prevDocId;
  TextEditingController dateController = TextEditingController();

  PaymentModelList paymentModeList= PaymentModelList();

  String? date = DateFormat('dd-MM-yyyy').format(DateTime.now());
  String? reason;
  double? advance;

  PaymentProvider() {
    getStaffList();
  }

  onRefresh() {
    notifyListeners();
  }

  // Future<void> getDataFromFireStore() async {
  //   List<Map<String, dynamic>> list =
  //       await FirebaseService.getDataFromFireStore(collectionName);
  //   paymentList = list.map((data) => PaymentModel.fromMap(data)).toList();
  //   notifyListeners();
  // }

  Future<void> getStaffList() async {
    List<Map<String, dynamic>> list =
        await FirebaseService.getDataFromFireStore("Staff Details");
    staffList = list.map((data) => StaffModel.fromMap(data)).toList();

    for (var staff in staffList) {
      if (staff.paymentList!.isNotEmpty) {
        paymentList.add(staff);
      }
    }

    print(paymentList);
    notifyListeners();
  }

  Future<String> saveData() async {
    staffModel.balanceSalary =
        (staffModel.balanceSalary ?? 0) - (paymentModeList.amount ?? 0);
    staffModel.advancePaid = (staffModel.advancePaid ?? 0) + (paymentModeList.amount ?? 0);
    paymentModeList.date = paymentModeList.date ?? date;
    staffModel.paymentList?.add(paymentModeList);
    final response = await FirebaseService.saveUserDataToFirebase(
        staffModel.id.toString(), "Staff Details", staffModel.toMap());
     // await FirebaseService.saveUserDataToFirebase(
     //    prevDocId!, collectionName, paymentModel.toMap());
    print(staffModel.toMap());
    return response;
    // return "";
  }

  // saveStaffData() async{
  //
  //   staffModel.balanceSalary = (staffModel.balanceSalary ?? 0) - (paymentModel.advanceAmount ?? 0);
  //    await FirebaseService.saveUserDataToFirebase(
  //       staffModel.id.toString(), "Staff Details", staffModel.toMap());
  // }


}
