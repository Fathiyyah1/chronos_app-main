import 'package:chronos/components/circular_progress_indicator.dart';
import 'package:chronos/components/curved_appbar.dart';
import 'package:chronos/const.dart';
import 'package:chronos/cubits/app_cubit.dart';
import 'package:chronos/models/transaction.dart';
import 'package:chronos/pages/expenses_tab.dart';
import 'package:chronos/requests/fetch_data.dart';
import 'package:flutter/material.dart';

class ExpensesPage extends StatelessWidget {
  const ExpensesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = AppCubit.get(context);
    // List<Transaction> transactions = appCubit.getTransactions();
    return FutureBuilder(
        future: fetchTransactions(context),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return getProgressIndicator();
          } else {
            List<Transaction> transactions = snapshot.data as List<Transaction>;
            return Column(
              children: [
                CurvedAppBar(
                  title: "Expenses",
                ),
                ExpensesTab(
                  usePadding: false,
                ),
              ],
            );
          }
        });
  }
}
