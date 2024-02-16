import 'dart:core';

import 'package:mas_ring_works/model/staff_model.dart';

class TaskModel {
  String? taskName;
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
  String? startTime;
  String? endTime;
  String? driverName;
  String? driverMobile;
  String? overTime;
  double? overTimeCharge;
  String? status;

  TaskModel(
      {this.taskName,
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
      this.startTime,
      this.endTime,
      this.driverName,
      this.driverMobile,
      this.overTime,
      this.overTimeCharge,this.status});

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      customerName: map['customerName'] ?? '',
      taskName: map['taskName'] ?? '',
      customerMobile: map['customerMobile'] ?? '',
      siteName: map['siteName'] ?? '',
      workDate: map['workDate'] ?? '',
      id: map['id'] ?? 0,
      location: map['location'] ?? '',
      item: map['item'] ?? '',
      amount: map['amount'] ?? 0,
      vehicleNumber: map['vehicleNumber'] ?? '',
      unit: map['unit'] ?? 0,
      staffData: List<StaffModel>.from(
          (map['staffData'] ?? []).map((x) => StaffModel.fromMap(x))),
      startTime: map['startTime'] ?? '',
      endTime: map['endTime'] ?? '',
      driverName: map['driverName'] ?? '',
      driverMobile: map['driverMobile'] ?? '',
      overTime: map['overTime'] ?? '',
      overTimeCharge: map['overTimeCharge'] ?? 0,
      status: map['status'] ?? "",
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'customerName': customerName,
      'taskName': taskName,
      'customerMobile': customerMobile,
      'siteName': siteName,
      'workDate': workDate,
      'id': id,
      'location': location,
      'unit': unit,
      'item': item,
      'amount': amount,
      'vehicleNumber': vehicleNumber,
      'staffData': staffData?.map((e) => {'id': e.id, 'name': e.name}).toList(),
      'startTime': startTime,
      'endTime': endTime,
      'driverName': driverName,
      'driverMobile': driverMobile,
      'overTime': overTime,
      'overTimeCharge': overTimeCharge,
      'status': status,
    };
  }
}
