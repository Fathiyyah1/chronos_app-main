import 'package:chronos/components/curved_appbar.dart';
import 'package:chronos/const.dart';
import 'package:chronos/cubits/app_cubit.dart';
import 'package:flutter/material.dart';

class LoanCalculationResults extends StatelessWidget {
  LoanCalculationResults(
      {Key? key,
      required this.monthlyPayment,
      required this.period,
      required this.total,
      required this.fPay,
      required this.interestAmount,
      required this.lPay})
      : super(key: key);
  double total;
  double monthlyPayment;
  double interestAmount;
  int period;
  double lPay;
  double fPay;

  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = AppCubit.get(context);
    return Scaffold(
      backgroundColor: appCubit.getBackgroundColor(),
      body: Column(
        children: [
          CurvedAppBar(
            title: "Loan Calculation Results",
            isBackButton: true,
          ),
          const SizedBox(height: 150),
          SizedBox(
            height: 300,
            width: MediaQuery.of(context).size.width * .9,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: appCubit.getBackgroundColor(),
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildRow("Total Amount", total.toStringAsFixed(2)),
                    const SizedBox(height: 10),
                    buildRow(
                        "Interest Amount", interestAmount.toStringAsFixed(2)),
                    const SizedBox(height: 10),
                    buildRow(
                        "Period", "$period Months, or ${period / 12} years."),
                    const SizedBox(height: 10),
                    buildRow("Total Monthly Payment",
                        monthlyPayment.toStringAsFixed(2)),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 150,
            width: MediaQuery.of(context).size.width * .9,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: appCubit.getBackgroundColor(),
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildRow("First payment", fPay.toStringAsFixed(2)),
                    const SizedBox(height: 10),
                    buildRow("Last payment", lPay.toStringAsFixed(2)),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

Row buildRow(String title, String value) {
  return Row(
    children: [
      Expanded(
          flex: 2,
          child: Text(
            title,
            style: subTitleStyle,
          )),
      Expanded(
          flex: 2,
          child: Text(
            value,
            style: subTitleStyle,
          )),
    ],
  );
}
