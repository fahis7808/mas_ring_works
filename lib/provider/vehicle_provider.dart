import 'package:flutter/material.dart';
import 'package:mas_ring_works/model/vehicle_model.dart';
import 'package:nb_utils/nb_utils.dart';

import '../service/firebase_service.dart';

class VehicleProvider extends ChangeNotifier {
  VehicleModel vehicleModel = VehicleModel();

  List<VehicleModel> vehicleList = [];
  String collectionName = "Vehicle Details";
  String? prevDocId;

  VehicleProvider() {
    getDataFromFireStore();
    getPreviousDocId();
  }

  Future<void> getDataFromFireStore() async {
    List<Map<String, dynamic>> list =
        await FirebaseService.getDataFromFireStore(collectionName);
    vehicleList = list.map((data) => VehicleModel.fromMap(data)).toList();
    print(vehicleList);
    notifyListeners();
  }

  Future<String> saveData() async {
    if (prevDocId == null || prevDocId == "") {
      prevDocId = "101";
    } else {
      prevDocId = (int.parse(prevDocId!) + 1).toString();
    }
    vehicleModel.id = prevDocId.toInt();
    final response = await FirebaseService.saveUserDataToFirebase(
        prevDocId!, collectionName, vehicleModel.toMap());
    return response;
  }

  Future<void> getPreviousDocId() async {
    prevDocId = await FirebaseService.getDocId(collectionName);
    print(prevDocId);
    notifyListeners();
  }
}
