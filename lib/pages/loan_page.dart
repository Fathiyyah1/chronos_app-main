import 'package:chronos/const.dart';
import 'package:chronos/pages/loan_calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../components/curved_appbar.dart';
import '../cubits/app_cubit.dart';

const textStyle1 = TextStyle(
    fontFamily: "Merriweather",
    fontSize: 16,
    color: Color.fromARGB(160, 255, 255, 255));
const textStyle2 = TextStyle(
    fontFamily: "Merriweather",
    fontSize: 16,
    color: Color.fromARGB(255, 210, 32, 32));

class LoanPage extends StatelessWidget {
  const LoanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = AppCubit.get(context);

    return SingleChildScrollView(
        child: Container(
      color: appCubit.getBackgroundColor(),
      child: Column(children: [
        CurvedAppBar(
          title: "Loans",
          // height: 130,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              width: 80,
              height: 80,
              child: Image.asset('assets/icons/rajhi.png'),
            ),
            Column(
              children: [
                IconButton(
                    color: Colors.teal,
                    iconSize: 100,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const LoanCalculator();
                        },
                      ));
                    },
                    icon: const Icon(Icons.calculate_outlined)),
                Text(
                  "Loan Calculator",
                  style: subTitleStyle,
                )
              ],
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.all(30),
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            color: appCubit.getCardBg(),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Text("Loan Amount: ", style: subTitleStyle),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        '1000 SAR',
                        style: textStyle1,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: const [
                      Text("Interest Rate: ", style: subTitleStyle),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        '7%',
                        style: textStyle1,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: const [
                      Text("Left: ", style: subTitleStyle),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        '970 SAR',
                        style: textStyle1,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text("Paid: ", style: subTitleStyle),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        '300 SAR',
                        style: textStyle1,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          // ignore: prefer_const_constructors
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Row(
            children: [
              Text(
                "Stumbles: ",
                style: subTitleStyle,
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 30, right: 30, top: 0, bottom: 10),
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            color: appCubit.getCardBg(),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(children: [
                Row(
                  children: [
                    Text("Date: ", style: subTitleStyle),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      '20/06/2022',
                      style: textStyle2,
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text("forfeit: ", style: subTitleStyle),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      '100 +',
                      style: textStyle2,
                    )
                  ],
                ),
              ]),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 30, right: 30, top: 0, bottom: 10),
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            color: appCubit.getCardBg(),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(children: [
                Row(
                  children: [
                    Text("Date: ", style: subTitleStyle),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      '18/01/2022',
                      style: textStyle2,
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text("forfeit: ", style: subTitleStyle),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      '100 +',
                      style: textStyle2,
                    )
                  ],
                ),
              ]),
            ),
          ),
        ),
      ]),
    ));
  }
}
