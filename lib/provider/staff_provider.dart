import 'package:flutter/widgets.dart';
import 'package:mas_ring_works/model/staff_model.dart';
import 'package:mas_ring_works/service/firebase_service.dart';

class StaffProvider extends ChangeNotifier {
  StaffModel staffModel = StaffModel();
  List<StaffModel> staffList = [];
  String collectionName = "Staff Details";
  String? prevDocId;

  bool isLoading = true;

  StaffProvider() {
    _init();
  }

  Future<void> _init() async {
    await getDataFromFireStore();
    await getPreviousDocId();
    isLoading = false;
    notifyListeners();
  }

  Future<void> getDataFromFireStore() async {
    isLoading = true;
    notifyListeners();
    try {
      List<Map<String, dynamic>> list =
      await FirebaseService.getDataFromFireStore(collectionName);
      staffList = list.map((data) => StaffModel.fromMap(data)).toList();
    } catch (e) {
      // Handle errors
      print("Error fetching data: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<String> saveData() async {
    isLoading = true;
    notifyListeners();
    try {
      if (prevDocId == null || prevDocId == "") {
        prevDocId = "1001";
        print(prevDocId);
      } else {
        prevDocId = (int.parse(prevDocId!) + 1).toString();
      }
      staffModel.id = int.parse(prevDocId!); // Convert to int properly
      final response = await FirebaseService.saveUserDataToFirebase(
          prevDocId!, collectionName, staffModel.toMap());
      isLoading = false;
      notifyListeners();
      return response;
    } catch (e) {
      isLoading = false;
      notifyListeners();
      print("Error saving data: $e");
      return "Error";
    }
  }

  Future<void> getPreviousDocId() async {
    try {
      prevDocId = await FirebaseService.getDocId(collectionName);
      notifyListeners();
    } catch (e) {
      // Handle errors
      print("Error getting previous doc ID: $e");
    }
  }
}
