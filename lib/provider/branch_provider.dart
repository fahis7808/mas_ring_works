import 'package:flutter/material.dart';
import 'package:mas_ring_works/model/branch_model.dart';

import '../service/firebase_service.dart';

class BranchProvider extends ChangeNotifier{
  BranchModel branchModel = BranchModel();
  List<BranchModel> branchList = [];


  BranchProvider() {
    getDataFromFireStore();
  }

  Future<void> getDataFromFireStore() async {
    List<Map<String, dynamic>> list = await FirebaseService.getDataFromFireStore("Branch Details");
    branchList = list.map((data) => BranchModel.fromMap(data)).toList();
    notifyListeners();
  }

  Future<String> saveData() async {
    final response = await FirebaseService.saveUserDataToFirebase(
        "Branch Details", branchModel.toMap());
    return response;
  }

}