import 'package:flutter/material.dart';
import 'package:mas_ring_works/model/branch_model.dart';

import '../service/firebase_service.dart';

class BranchProvider extends ChangeNotifier {
  BranchModel branchModel = BranchModel();
  List<BranchModel> branchList = [];
  String collectionName = "Branch Details";
  String? prevDocId;

  BranchProvider() {
    getDataFromFireStore();
    getPreviousDocId();
  }

  Future<void> getDataFromFireStore() async {
    List<Map<String, dynamic>> list =
        await FirebaseService.getDataFromFireStore(collectionName);
    branchList = list.map((data) => BranchModel.fromMap(data)).toList();
    notifyListeners();
  }

  Future<String> saveData() async {
    if (prevDocId == null || prevDocId == "") {
      prevDocId = "1";
      print(prevDocId);
    } else {
      prevDocId = (int.parse(prevDocId!) + 1).toString();
    }
    final response = await FirebaseService.saveUserDataToFirebase(
        prevDocId!, collectionName, branchModel.toMap());
    return response;
  }

  Future<void> getPreviousDocId() async {
    prevDocId = await FirebaseService.getDocId(collectionName);
    notifyListeners();
  }
}
