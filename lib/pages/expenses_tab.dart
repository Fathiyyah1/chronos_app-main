import 'package:chronos/components/circular_progress_indicator.dart';
import 'package:chronos/components/curved_appbar.dart';
import 'package:chronos/const.dart';
import 'package:chronos/cubits/app_cubit.dart';
import 'package:chronos/models/transaction.dart';
import 'package:chronos/requests/fetch_data.dart';
import 'package:flutter/material.dart';

class ExpensesTab extends StatelessWidget {
  ExpensesTab({Key? key, required this.usePadding}) : super(key: key);
  bool usePadding;
  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = AppCubit.get(context);

    return FutureBuilder(
        future: fetchTransactions(context),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return getProgressIndicator();
          } else {
            List<Transaction> transactions = snapshot.data as List<Transaction>;
            return Padding(
              padding: EdgeInsets.fromLTRB(
                0,
                0,
                0,
                usePadding ? 150 : 0,
              ),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: transactions.length,
                itemBuilder: (context, i) {
                  return SizedBox(
                    height: 130,
                    child: Card(
                      color: appCubit.getBackgroundColor(),
                      elevation: 10,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Icon(
                              transactions[i].category.icon,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            flex: 3,
                            child: Text(
                              transactions[i].name,
                              style: subTitleStyle,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            flex: 1,
                            child: Text(
                              "${transactions[i].amount.toStringAsFixed(2)} SAR",
                              style: subTitleStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }
        });
  }
}
