import 'package:flutter/material.dart';
import 'package:mas_ring_works/model/branch_model.dart';

import '../service/firebase_service.dart';

class BranchProvider extends ChangeNotifier {
  BranchModel branchModel = BranchModel();
  List<BranchModel> branchList = [];
  String collectionName = "Branch Details";
  String? prevDocId;

  bool isLoading = true;
  bool isButtonLoading = false;

  BranchProvider() {
    _init();
  }

  Future<void> _init() async {
    await getDataFromFireStore();
    await getPreviousDocId();
    isLoading = false;
    notifyListeners();
  }

  Future<void> getDataFromFireStore() async {
    try {
      isLoading = true;
      notifyListeners();
      List<Map<String, dynamic>> list =
      await FirebaseService.getDataFromFireStore(collectionName);
      branchList = list.map((data) => BranchModel.fromMap(data)).toList();
    } catch (e) {
      print("Error fetching data: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<String> saveData() async {
    try {
      isButtonLoading = true;
      notifyListeners();
      if (prevDocId == null || prevDocId == "") {
        prevDocId = "1";
        print(prevDocId);
      } else {
        prevDocId = (int.parse(prevDocId!) + 1).toString();
      }
      branchModel.id = int.parse(prevDocId!);
      final response = await FirebaseService.saveUserDataToFirebase(
          prevDocId!, collectionName, branchModel.toMap());
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
    try {
      prevDocId = await FirebaseService.getDocId(collectionName);
      notifyListeners();
    } catch (e) {
      print("Error getting previous doc ID: $e");
    }
  }
}
