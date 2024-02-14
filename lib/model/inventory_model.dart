import 'dart:core';

class InventoryModel {
  int? id;
  String? itemName;
  String? itemType;
  double? itemSize;
  double? makingCost;

  InventoryModel({
    this.itemName,
    this.id,
    this.itemSize,
    this.itemType,
    this.makingCost,
  });

  factory InventoryModel.fromMap(Map<String, dynamic> map) {
    return InventoryModel(
        itemName: map['itemName'] ?? '',
        id: map['id'] ?? 0,
        itemType: map['itemType'] ?? '',
        makingCost: map['makingCost'] ?? 0,
        itemSize: map['itemSize'] ?? 0);
  }

  Map<String, dynamic> toMap() {
    return {
      'itemName': itemName,
      'id': id,
      'itemSize': itemSize,
      'itemType': itemType,
      'makingCost': makingCost,
    };
  }
}
