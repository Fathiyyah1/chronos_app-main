import 'package:chronos/models/bank_account.dart';
import 'package:chronos/models/category.dart';
import 'package:flutter/material.dart';

class Transaction {
  BankAccount bank;
  String name;
  String? qrData;
  Category category;
  double amount;
  DateTime date;
  Transaction({
    required this.bank,
    required this.name,
    required this.category,
    required this.amount,
    required this.date,
    this.qrData,
  });
  factory Transaction.fromJson(Map data) {
    return Transaction(
      bank: BankAccount(name: "Alrajhi Bank", iban: "78264387632478623"),
      name: data["name"],
      category: Category(name: data["category"], icon: Icons.add_shopping_cart),
      amount: data["amount"],
      date: DateTime.parse(data["date"]),
    );
  }
}
