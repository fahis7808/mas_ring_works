import 'dart:core';

class UserModel {
  String? name;
  String? email;
  String? profilePic;
  String? businessName;
  String? createdAt;
  String? phoneNumber;
  String? uid;

  UserModel(
      {this.name,
      this.email,
      this.profilePic,
      this.businessName,
      this.createdAt,
      this.phoneNumber,
      this.uid});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        name: map['name'] ?? '',
        email: map['email'] ?? '',
        profilePic: map['profilePic'] ?? '',
        createdAt: map['createdAt'] ?? '',
        phoneNumber: map['phoneNumber'] ?? '',
        uid: map['uid'] ?? "",
        businessName: map['businessName'] ?? '');
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'profilePic': profilePic,
      'createdAt': createdAt,
      'phoneNumber': phoneNumber,
      'uid': uid,
      'businessName': businessName,
    };
  }
}
