import 'dart:core';

class VehicleModel {
  int? id;
  String? driverName;
  String? vehicleType;
  String? vehicleNumber;
  String? photo;
  String? vehicleUsage;
  String? driverNumber;
  double? loadCapacity;


  VehicleModel(
      {this.driverName,
        this.vehicleUsage,
        this.photo,
        this.driverNumber,
        this.id,this.vehicleNumber,this.vehicleType,this.loadCapacity,});

  factory VehicleModel.fromMap(Map<String, dynamic> map) {
    return VehicleModel(
        driverName: map['driverName'] ?? '',
        vehicleUsage: map['vehicleUsage'] ?? '',
        photo: map['photo'] ?? '',
        driverNumber: map['driverNumber'] ?? '',
        id: map['id'] ?? 0,
        vehicleType: map['vehicleType'] ?? '',
        loadCapacity: map['loadCapacity'] ?? 0,
        vehicleNumber: map['vehicleNumber'] ?? "");
  }

  Map<String, dynamic> toMap() {
    return {
      'driverName': driverName,
      'vehicleUsage': vehicleUsage,
      'photo': photo,
      'driverNumber': driverNumber,
      'id': id,
      'vehicleNumber' : vehicleNumber,
      'vehicleType' : vehicleType,
      'loadCapacity' : loadCapacity,
    };
  }
}
