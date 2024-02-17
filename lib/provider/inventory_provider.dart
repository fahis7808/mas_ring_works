import 'package:flutter/cupertino.dart';
import 'package:mas_ring_works/model/inventory_model.dart';

import '../service/firebase_service.dart';

class InventoryProvider extends ChangeNotifier {
  InventoryModel itemModel = InventoryModel();
  List<InventoryModel> itemList = [];
  String collectionName = "Item Details";
  String? prevDocId;

  bool isLoading = true;
  bool isButtonLoading = false;

  InventoryProvider() {
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
      itemList = list.map((data) => InventoryModel.fromMap(data)).toList();
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
        prevDocId = "11";
        print(prevDocId);
      } else {
        prevDocId = (int.parse(prevDocId!) + 1).toString();
      }
      itemModel.id = int.parse(prevDocId!);
      final response = await FirebaseService.saveUserDataToFirebase(
          prevDocId!, collectionName, itemModel.toMap());
      return response;
    } catch (e) {
      print("Error saving data: $e");
      return "Error";
    } finally {
      isButtonLoading = false;
      notifyListeners();
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
