import 'dart:core';

import 'package:mas_ring_works/model/payment_model.dart';

class StaffModel {
  String? name;
  String? email;
  String? photo;
  String? jobType;
  String? phoneNumber;
  int? id;
  double? salary;
  String? salaryType;
  double? overTimeHour;
  double? overTimeWage;
  double? balanceSalary;
  double? totalSalary;
  double? advancePaid;
  double? totalWorkingDays;
  List<PaymentModelList>? paymentList;
  List<StaffTaskModel>? taskList;

  StaffModel(
      {this.name,
      this.email,
      this.photo,
      this.jobType,
      this.phoneNumber,
      this.id,
      this.salary,
      this.salaryType,
      this.overTimeHour,
      this.overTimeWage,
      this.balanceSalary,
      this.totalSalary,
      this.advancePaid,
      this.totalWorkingDays,
      this.paymentList,
      this.taskList});

  factory StaffModel.fromMap(Map<String, dynamic> map) {
    return StaffModel(
        name: map['name'] ?? '',
        email: map['email'] ?? '',
        photo: map['photo'] ?? '',
        phoneNumber: map['phoneNumber'] ?? '',
        id: map['id'] ?? 0,
        jobType: map['jobType'] ?? '',
        salaryType: map['salaryType'] ?? '',
        overTimeHour: map['overTimeHour'] ?? 0,
        overTimeWage: map['overTimeWage'] ?? 0,
        salary: map['salary'] ?? 0,
        totalSalary: map['totalSalary'] ?? 0,
        balanceSalary: map['balanceSalary'] ?? 0,
        advancePaid: map['advancePaid'] ?? 0,
        totalWorkingDays: map['totalWorkingDays'] ?? 0,
        paymentList: List<PaymentModelList>.from((map['paymentModelList'] ?? [])
            .map((x) => PaymentModelList.fromMap(x))),
        taskList: List<StaffTaskModel>.from(
            (map['task'] ?? []).map((x) => StaffTaskModel.fromMap(x))));
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'photo': photo,
      'phoneNumber': phoneNumber,
      'id': id,
      'jobType': jobType,
      'salary': salary,
      'salaryType': salaryType,
      'overTimeHour': overTimeHour,
      'overTimeWage': overTimeWage,
      'totalSalary': totalSalary,
      'balanceSalary': balanceSalary,
      'advancePaid': advancePaid,
      'totalWorkingDays': totalWorkingDays,
      'paymentModelList': paymentList?.map((e) => e.toMap()).toList(),
      'task':
          taskList?.map((e) => e.toMap()).toList()
    };
  }
}

class StaffTaskModel {
  int? id;
  int? tripId;
  String? workDate;
  double? workSalary;

  StaffTaskModel({
    this.id,
    this.tripId,
    this.workDate,
    this.workSalary,
  });

  factory StaffTaskModel.fromMap(Map<String, dynamic> map) {
    return StaffTaskModel(
      id: map['id'] ?? 0,
      tripId: map['tripId'] ?? 0,
      workDate: map['workDate'] ?? '',
      workSalary: map['workSalary'] ?? 0,
    );
  }

  Map<String, dynamic> toMap(){
    return {
      "id" : id,
      "tripId" : tripId,
      "workDate" : workDate,
      "workSalary" : workSalary
    };
  }

}
