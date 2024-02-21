import 'package:chronos/components/curved_appbar.dart';
import 'package:chronos/components/messages_methods.dart';
import 'package:chronos/components/textfield.dart';
import 'package:chronos/const.dart';
import 'package:chronos/cubits/app_cubit.dart';
import 'package:chronos/pages/loan_results.dart';
import 'package:flutter/material.dart';

class LoanCalculator extends StatefulWidget {
  const LoanCalculator({Key? key}) : super(key: key);

  @override
  State<LoanCalculator> createState() => _LoanCalculatorState();
}

class _LoanCalculatorState extends State<LoanCalculator> {
  TextEditingController amountContr = TextEditingController();
  TextEditingController interestContr = TextEditingController();
  TextEditingController periodContr = TextEditingController();
  TextEditingController fPayContr = TextEditingController();
  TextEditingController lPayContr = TextEditingController();
  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = AppCubit.get(context);
    double width = MediaQuery.of(context).size.width * .8;

    return Scaffold(
      backgroundColor: appCubit.getBackgroundColor(),
      body: Column(
        children: [
          CurvedAppBar(
            title: "Loan Calculator",
            isBackButton: true,
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: width + 50,
            child: Card(
              color: Colors.blueGrey[900],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: getTextField(
                    title: "Amount",
                    controller: amountContr,
                    onChanged: (p0) {},
                    icon: Icons.monetization_on_outlined),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            width: width + 50,
            height: 170,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: Colors.blueGrey[900],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    getTextField(
                      title: "Interest Rate ( in percentage )",
                      onChanged: (p0) {},
                      controller: interestContr,
                      icon: Icons.money_outlined,
                    ),
                    const SizedBox(height: 10),
                    getTextField(
                      title: "Period (in months)",
                      onChanged: (p0) {},
                      controller: periodContr,
                      icon: Icons.date_range,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: width + 50,
            height: 170,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: Colors.blueGrey[900],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    getTextField(
                      title: "First Payment",
                      onChanged: (p0) {},
                      controller: fPayContr,
                      icon: Icons.money_outlined,
                    ),
                    const SizedBox(height: 10),
                    getTextField(
                      title: "Last Payment",
                      onChanged: (p0) {},
                      controller: lPayContr,
                      icon: Icons.money_outlined,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
              width: width + 50,
              height: 40,
              child: OutlinedButton(
                onPressed: () {
                  try {
                    double amount = double.parse(amountContr.text);
                    double interest = double.parse(interestContr.text);
                    int period = int.parse(periodContr.text);
                    double fPay = double.parse(fPayContr.text);
                    double lPay = double.parse(lPayContr.text);
                    double interestAmount = (amount * (interest / 100));
                    double total = (amount + interestAmount);
                    double totalInstallments =
                        (amount + interestAmount) - (fPay + lPay);
                    double monthly = totalInstallments / 12;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoanCalculationResults(
                            monthlyPayment: monthly,
                            period: period,
                            total: total,
                            interestAmount: interestAmount,
                            fPay: fPay,
                            lPay: lPay,
                          ),
                        ));
                  } catch (e) {
                    showSnackBar(
                        "Please fix the fields, ${e.toString()}", context);
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text(
                      "Calculate",
                      style: subTitleStyle,
                    ),
                    Icon(
                      Icons.calculate_outlined,
                      color: Colors.white,
                      size: 30,
                    )
                  ],
                ),
                style: OutlinedButton.styleFrom(backgroundColor: Colors.teal),
              )),
        ],
      ),
    );
  }
}
