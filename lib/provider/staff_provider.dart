import 'package:flutter/widgets.dart';
import 'package:mas_ring_works/model/staff_model.dart';
import 'package:mas_ring_works/service/firebase_service.dart';

class StaffProvider extends ChangeNotifier {
  StaffModel staffModel = StaffModel();
  List<StaffModel> staffList = [];
  String collectionName = "Staff Details";
  String? prevDocId;

  StaffProvider() {
    getDataFromFireStore();
    getPreviousDocId();
  }

  Future<void> getDataFromFireStore() async {
    List<Map<String, dynamic>> list =
    await FirebaseService.getDataFromFireStore(collectionName);
    staffList = list.map((data) => StaffModel.fromMap(data)).toList();
    notifyListeners();
  }

  Future<String> saveData() async {
    if (prevDocId == null || prevDocId == "") {
      prevDocId = "1001";
      print(prevDocId);
    } else {
      prevDocId = (int.parse(prevDocId!) + 1).toString();
    }
    final response = await FirebaseService.saveUserDataToFirebase(
        prevDocId!, collectionName, staffModel.toMap());
    return response;
  }

  Future<void> getPreviousDocId() async {
    prevDocId = await FirebaseService.getDocId(collectionName);
    notifyListeners();
  }
}
