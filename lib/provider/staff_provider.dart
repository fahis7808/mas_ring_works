import 'package:flutter/widgets.dart';
import 'package:mas_ring_works/model/staff_model.dart';
import 'package:mas_ring_works/service/firebase_service.dart';


class StaffProvider extends ChangeNotifier {
  StaffModel staffModel = StaffModel();
  List<StaffModel> staffList = [];

  StaffProvider() {
    getDataFromFireStore();
  }

  Future<void> getDataFromFireStore() async {
    List<Map<String, dynamic>> list = await FirebaseService.getDataFromFireStore("Staff Details");
    staffList = list.map((data) => StaffModel.fromMap(data)).toList();
    notifyListeners();
  }

 Future<String> saveData() async {
    final response = await FirebaseService.saveUserDataToFirebase(
        "Staff Details", staffModel.toMap());
    return response;
  }
}
