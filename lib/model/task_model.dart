import 'dart:core';

import 'package:mas_ring_works/model/staff_model.dart';

class TaskModel {
  String? customerName;
  String? customerMobile;
  String? siteName;
  String? location;
  String? workDate;
  String? item;
  int? id;
  double? unit;
  double? amount;
  String? vehicleNumber;
  List<StaffModel>? staffData;

  TaskModel({
    this.customerName,
    this.customerMobile,
    this.siteName,
    this.location,
    this.workDate,
    this.id,
    this.unit,
    this.item,
    this.amount,
    this.vehicleNumber,
    this.staffData,
  });

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      customerName: map['customerName'] ?? '',
      customerMobile: map['customerMobile'] ?? '',
      siteName: map['siteName'] ?? '',
      workDate: map['workDate'] ?? '',
      id: map['id'] ?? 0,
      location: map['location'] ?? '',
      item: map['item'] ?? '',
      amount: map['amount'] ?? 0,
      vehicleNumber: map['vehicleNumber'] ?? '',
      unit: map['unit'] ?? 0,
      staffData: List<StaffModel>.from((map['staffData'] ?? []).map((x) => StaffModel.fromMap(x))),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'customerName': customerName,
      'customerMobile': customerMobile,
      'siteName': siteName,
      'workDate': workDate,
      'id': id,
      'location': location,
      'unit': unit,
      'item': item,
      'amount': amount,
      'vehicleNumber': vehicleNumber,
      'staffData': staffData?.map((e) => e.toMap()).toList(),
    };
  }
}
