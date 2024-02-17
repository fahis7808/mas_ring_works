import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mas_ring_works/model/payment_model.dart';
import 'package:mas_ring_works/model/staff_model.dart';
import 'package:mas_ring_works/service/firebase_service.dart';

class PaymentProvider extends ChangeNotifier {
  List<StaffModel> paymentList = [];
  List<StaffModel> staffList = [];
  StaffModel staffModel = StaffModel();
  String collectionName = "Payment Details";
  String? prevDocId;
  TextEditingController dateController = TextEditingController();
  PaymentModelList paymentModeList = PaymentModelList();
  bool isLoading = true;
  bool isButtonLoading = false;
  String? date = DateFormat('dd-MM-yyyy').format(DateTime.now());

  PaymentProvider() {
    getStaffList();
  }

  onRefresh() {
    notifyListeners();
  }

  Future<void> getStaffList() async {
    isLoading = true;
    notifyListeners();
    try {
      List<Map<String, dynamic>> list =
      await FirebaseService.getDataFromFireStore("Staff Details");
      staffList = list.map((data) => StaffModel.fromMap(data)).toList();

      for (var staff in staffList) {
        if (staff.paymentList!.isNotEmpty) {
          if(paymentList.contains(staff)){
            paymentList;
          }else{
          paymentList.add(staff);
          }
        }
      }
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
      staffModel.balanceSalary =
          (staffModel.balanceSalary ?? 0) - (paymentModeList.amount ?? 0);
      staffModel.advancePaid =
          (staffModel.advancePaid ?? 0) + (paymentModeList.amount ?? 0);
      paymentModeList.date = paymentModeList.date ?? date;
      staffModel.paymentList?.add(paymentModeList);
      final response = await FirebaseService.saveUserDataToFirebase(
          staffModel.id.toString(), "Staff Details", staffModel.toMap());
      print(staffModel.toMap());
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
