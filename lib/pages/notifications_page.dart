import 'package:chronos/components/curved_appbar.dart';
import 'package:chronos/const.dart';
import 'package:chronos/cubits/app_cubit.dart';
import 'package:chronos/pages/expenses_tab.dart';
import 'package:chronos/pages/personal_debts_tab.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = AppCubit.get(context);
    return Scaffold(
      backgroundColor: appCubit.getBackgroundColor(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CurvedAppBar(
              height: 130,
              title: "Notifications",
              isBackButton: true,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(25, 30, 25, 0),
              child: TabSection(),
            )
          ],
        ),
      ),
    );
  }
}

class TabSection extends StatelessWidget {
  const TabSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(40)),
              border: Border.all(
                color: const Color.fromRGBO(14, 215, 168, 1),
              ),
            ),
            child: const ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
              ),
              child: TabBar(
                indicator: BoxDecoration(
                  color: Color.fromRGBO(14, 215, 168, 1),
                ),
                labelColor: Color.fromRGBO(238, 248, 254, 1),
                unselectedLabelColor: Color.fromRGBO(238, 248, 254, 1),
                tabs: [
                  Text(
                    "Loans",
                    style: subTitleStyle,
                  ),
                  Text(
                    "Expenses",
                    style: subTitleStyle,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: TabBarView(
              children: [
                PersonalDebtsTab(),
                ExpensesTab(
                  usePadding: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
