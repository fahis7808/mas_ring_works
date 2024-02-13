import 'dart:core';

class BranchModel {
  String? id;
  String? photo;
  String? branchName;
  String? branchMobile;
  String? branchLocation;
  String? managerName;

  BranchModel({
    this.branchName,
    this.managerName,
    this.photo,
    this.id,
    this.branchMobile,
    this.branchLocation,
  });

  factory BranchModel.fromMap(Map<String, dynamic> map) {
    return BranchModel(
        branchName: map['branchName'] ?? '',
        managerName: map['managerName'] ?? '',
        photo: map['photo'] ?? '',
        id: map['id'] ?? "",
        branchLocation: map['branchLocation'] ?? '',
        branchMobile: map['branchMobile'] ?? "");
  }

  Map<String, dynamic> toMap() {
    return {
      'branchName': branchName,
      'managerName': managerName,
      'photo': photo,
      'id': id,
      'branchMobile': branchMobile,
      'branchLocation': branchLocation,
    };
  }
}
