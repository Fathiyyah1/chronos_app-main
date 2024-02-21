import 'dart:typed_data';

import 'package:chronos/models/user.dart';

class PersonalDebt {
  User fromUser;
  User toUser;
  double totalAmount;
  DateTime dateStarted;
  int? durationMonths;
  bool? isAccepted;
  PersonalDebt({
    required this.dateStarted,
    this.durationMonths,
    required this.fromUser,
    required this.toUser,
    required this.totalAmount,
    this.isAccepted,
  });
  factory PersonalDebt.fromJson(Map data) {
    return PersonalDebt(
      dateStarted: DateTime.parse(data["dateStarted"]),
      fromUser: User.fromJson(data["fromUser"]),
      toUser: User.fromJson(data["toUser"]),
      totalAmount: data["totalAmount"],
    );
  }
}
