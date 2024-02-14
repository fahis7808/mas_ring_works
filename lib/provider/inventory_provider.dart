import 'package:flutter/cupertino.dart';
import 'package:mas_ring_works/model/inventory_model.dart';
import 'package:nb_utils/nb_utils.dart';

import '../service/firebase_service.dart';

class InventoryProvider extends ChangeNotifier {
  InventoryModel itemModel = InventoryModel();
  List<InventoryModel> itemList = [];
  String collectionName = "Item Details";
  String? prevDocId;

  InventoryProvider() {
    getDataFromFireStore();
    getPreviousDocId();
  }

  Future<void> getDataFromFireStore() async {
    List<Map<String, dynamic>> list =
        await FirebaseService.getDataFromFireStore(collectionName);
    itemList = list.map((data) => InventoryModel.fromMap(data)).toList();
    notifyListeners();
  }

  Future<String> saveData() async {
    if (prevDocId == null || prevDocId == "") {
      prevDocId = "11";
      print(prevDocId);
    } else {
      prevDocId = (int.parse(prevDocId!) + 1).toString();
    }
    itemModel.id = prevDocId.toInt();
    final response = await FirebaseService.saveUserDataToFirebase(
        prevDocId!, collectionName, itemModel.toMap());
    return response;
  }

  Future<void> getPreviousDocId() async {
    prevDocId = await FirebaseService.getDocId(collectionName);
    notifyListeners();
  }
}
