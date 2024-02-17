import 'package:flutter/material.dart';
import 'package:mas_ring_works/model/vehicle_model.dart';

import '../service/firebase_service.dart';

class VehicleProvider extends ChangeNotifier {
  VehicleModel vehicleModel = VehicleModel();
  List<VehicleModel> vehicleList = [];
  String collectionName = "Vehicle Details";
  String? prevDocId;
  bool isLoading = true;
  bool isBtnLoading = false;

  VehicleProvider() {
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
      vehicleList =
          list.map((data) => VehicleModel.fromMap(data)).toList();
      print(vehicleList);
    } catch (e) {
      print("Error fetching data: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<String> saveData() async {
    isBtnLoading = true;
    notifyListeners();
    try {
      if (prevDocId == null || prevDocId == "") {
        prevDocId = "101";
      } else {
        prevDocId = (int.parse(prevDocId!) + 1).toString();
      }
      vehicleModel.id = int.parse(prevDocId!);
      final response = await FirebaseService.saveUserDataToFirebase(
          prevDocId!, collectionName, vehicleModel.toMap());
      isBtnLoading = false;
      notifyListeners();
      return response;
    } catch (e) {
      isBtnLoading = false;
      notifyListeners();
      print("Error saving data: $e");
      return "Error";
    }
  }

  Future<void> getPreviousDocId() async {
    try {
      prevDocId = await FirebaseService.getDocId(collectionName);
      print(prevDocId);
      notifyListeners();
    } catch (e) {
      print("Error getting previous doc ID: $e");
    }
  }
}
