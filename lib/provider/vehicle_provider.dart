import 'package:flutter/material.dart';
import 'package:mas_ring_works/model/vehicle_model.dart';

import '../service/firebase_service.dart';

class VehicleProvider extends ChangeNotifier{
  VehicleModel vehicleModel = VehicleModel();

  List<VehicleModel> vehicleList = [];

  VehicleProvider() {
    getDataFromFireStore();
  }

  Future<void> getDataFromFireStore() async {
    List<Map<String, dynamic>> list = await FirebaseService.getDataFromFireStore("Vehicle Details");
    vehicleList = list.map((data) => VehicleModel.fromMap(data)).toList();
   print(vehicleList);
    notifyListeners();
  }

  Future<String> saveData() async {
    final response = await FirebaseService.saveUserDataToFirebase(
        "Vehicle Details", vehicleModel.toMap());
    return response;
  }
}