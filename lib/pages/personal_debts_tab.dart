import 'package:chronos/components/buttons/accept_button.dart';
import 'package:chronos/components/buttons/decline_button.dart';
import 'package:chronos/components/circular_progress_indicator.dart';
import 'package:chronos/const.dart';
import 'package:chronos/cubits/app_cubit.dart';
import 'package:chronos/models/personal_debt.dart';
import 'package:chronos/requests/fetch_data.dart';
import 'package:flutter/material.dart';

class PersonalDebtsTab extends StatefulWidget {
  PersonalDebtsTab({
    Key? key,
  }) : super(key: key);

  @override
  State<PersonalDebtsTab> createState() => _PersonalDebtsTabState();
}

class _PersonalDebtsTabState extends State<PersonalDebtsTab> {
  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = AppCubit.get(context);
    // List<PersonalDebt> personalDebts = widget.personalDebts;
    return FutureBuilder(
      future: fetchPersonalDebts(context),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return getProgressIndicator();
        } else {
          List<PersonalDebt> personalDebts =
              snapshot.data as List<PersonalDebt>;
          return Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 150),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: personalDebts.length,
              itemBuilder: (context, i) {
                return SizedBox(
                  height: 200,
                  child: Card(
                    color: appCubit.getBackgroundColor(),
                    elevation: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${personalDebts[i].fromUser.name} has proposed you a loan",
                          style: subTitleStyle,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                (personalDebts[i].durationMonths != null)
                                    ? "${personalDebts[i].totalAmount.toStringAsFixed(2)} SAR on ${personalDebts[i].durationMonths} months."
                                    : "${personalDebts[i].totalAmount.toStringAsFixed(2)} SAR, No duration specified",
                                style: subTitleStyle,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            DeclineButton(onPressed: () {}),
                            AcceptButton(onPressed: () {}),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
