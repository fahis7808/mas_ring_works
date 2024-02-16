import 'dart:core';


class PaymentModelList {
  String? date;
  String? reason;
  double? amount;

  PaymentModelList({
    this.reason,
    this.date,
    this.amount,
  });

  factory PaymentModelList.fromMap(Map<String, dynamic> map) {
    return PaymentModelList(
        date: map['date'] ?? '',
        amount: map['amount'] ?? 0,
        reason: map['reason'] ?? "");
  }

  Map<String, dynamic> toMap() {
    return {
      'reason': reason,
      'date': date,
      'amount': amount,
    };
  }
}
