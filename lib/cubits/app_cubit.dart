import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:chronos/components/messages_methods.dart';
import 'package:chronos/components/progress_indicator.dart';
import 'package:chronos/cubits/app_states.dart';
import 'package:chronos/models/bank_account.dart';
import 'package:chronos/models/category.dart';
import 'package:chronos/models/personal_debt.dart';
import 'package:chronos/models/transaction.dart';
import 'package:chronos/models/user.dart';
import 'package:chronos/pages/home_page.dart';
import 'package:chronos/requests/fetch_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitState());
  static AppCubit get(BuildContext context) => BlocProvider.of(context);
  bool isDarkTheme = true;
  late User user;
  int currentIndex = 0;
  List<Category> demoCategories = [
    Category(name: "Shopping", icon: Icons.shopping_cart_outlined),
    Category(name: "Car Repair", icon: Icons.car_repair_outlined),
    Category(name: "Personal Debt", icon: Icons.person_outline),
    Category(name: "Grocery", icon: Icons.local_grocery_store_outlined),
    Category(name: "Food", icon: Icons.food_bank_outlined),
  ];
  List<BankAccount> demoBankAccounts = [
    BankAccount(name: "Alrajhi Bank", iban: "238974198723129387123222"),
    BankAccount(name: "AlAhli Bank", iban: "109834857531293871232224"),
  ];

  List<Transaction> getTransactions() {
    List<Transaction> demoTransactions = [
      Transaction(
        bank: demoBankAccounts[0],
        name: "Nike Store",
        category: demoCategories[0],
        amount: 200,
        date: DateTime.now(),
      ),
      Transaction(
        bank: demoBankAccounts[0],
        name:
            "Your current STC Package is higher than your typical usage, try to switch to a lower package",
        category: demoCategories[0],
        amount: 200,
        date: DateTime.now(),
      ),
    ];
    return demoTransactions;
  }

  Color? getBackgroundColor() {
    return isDarkTheme ? Colors.grey[900] : Colors.white;
  }

  Color? getCardBg() {
    return isDarkTheme ? Colors.grey[850] : Colors.white;
  }

  double getTotalExpenses() {
    double total = 0;
    List<Transaction> transactions = getTransactions();
    for (int i = 0; i < transactions.length; i++) {
      total += transactions[i].amount;
    }
    return total;
  }

  Future<User?> getUser(
      BuildContext context, String username, String password) async {
    showProgressIndicator(context);
    try {
      User? gottenUser = await loginUser(username, password);
      if (gottenUser != null) {
        user = gottenUser;
        emit(TriggerApp());
        Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const HomePage()));
      }
    } catch (e) {
      Navigator.pop(context);
      showSnackBar("Wrong credentials", context);
    }
  }

  void updateUserAvatar(Uint8List? avatar) {
    user.avatar = avatar;
    emit(TriggerApp());
  }

  Future<List<PersonalDebt>> getPersonalDebts(BuildContext context) async {
    List<PersonalDebt> personalDebts = await fetchPersonalDebts(context);
    // [
    //   PersonalDebt(
    //     dateStarted: DateTime.now(),
    //     fromUser: getUser(),
    //     toUser: User(
    //         id: 1, username: "Hussain", name: "H.AlSaggaf", totalIncome: 7500),
    //     totalAmount: 1500,
    //   )
    // ];
    return personalDebts;
  }

  void updatePersonalLoan() {}

  double getExpensesChangeRatio() {
    return 25;
  }
}
