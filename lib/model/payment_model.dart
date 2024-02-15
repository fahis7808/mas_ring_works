import 'dart:core';

class PaymentModel {
  int? staffId;
  String? staffName;
  String? date;
  String? reason;
  double? balance;
  String? staffNumber;
  double? advanceAmount;

  PaymentModel({
    this.staffName,
    this.balance,
    this.staffNumber,
    this.staffId,
    this.reason,
    this.date,
    this.advanceAmount,
  });

  factory PaymentModel.fromMap(Map<String, dynamic> map) {
    return PaymentModel(
        staffName: map['staffName'] ?? '',
        balance: map['balance'] ?? 0,
        staffNumber: map['staffNumber'] ?? '',
        staffId: map['staffId'] ?? 0,
        date: map['date'] ?? '',
        advanceAmount: map['advanceAmount'] ?? 0,
        reason: map['reason'] ?? "");
  }

  Map<String, dynamic> toMap() {
    return {
      'staffName': staffName,
      'balance': balance,
      'staffNumber': staffNumber,
      'staffId': staffId,
      'reason': reason,
      'date': date,
      'advanceAmount': advanceAmount,
    };
  }
}
