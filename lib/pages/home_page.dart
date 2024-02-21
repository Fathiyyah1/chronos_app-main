import 'package:chronos/components/chart.dart';
import 'package:chronos/components/curved_appbar.dart';
import 'package:chronos/const.dart';
import 'package:chronos/cubits/app_cubit.dart';
import 'package:chronos/models/transaction.dart';
import 'package:chronos/pages/add_transaction.dart';
import 'package:chronos/pages/expenses_page.dart';
import 'package:chronos/pages/expenses_tab.dart';
import 'package:chronos/pages/loan_page.dart';
import 'package:chronos/pages/notifications_page.dart';
import 'package:chronos/pages/profile_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = AppCubit.get(context);
    List<Transaction> transactions = appCubit.getTransactions();
    List<Widget> pages = [
      HomePageColumn(appCubit: appCubit, transactions: transactions),
      const ExpensesPage(),
      const LoanPage(),
      ProfilePage(
        user: appCubit.user,
        useBack: false,
      ),
    ];

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CircleAvatar(
        radius: 28,
        backgroundColor: Colors.white,
        child: IconButton(
          color: Colors.black,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AddExpensePage(
                    isScanned: false,
                    transaction: Transaction(
                      bank: appCubit.demoBankAccounts[0],
                      name: "",
                      category: appCubit.demoCategories[0],
                      amount: 0,
                      date: DateTime.now(),
                    ),
                  ),
                ));
          },
          icon: const Icon(
            Icons.add_outlined,
            color: Colors.black,
            size: 30,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.home_outlined),
          ),
          BottomNavigationBarItem(
            label: "Expenses",
            icon: Icon(
              Icons.align_vertical_bottom_sharp,
            ),
          ),
          BottomNavigationBarItem(
            label: "Loans",
            icon: Icon(
              Icons.local_atm_rounded,
            ),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(
              Icons.person_outline,
            ),
          ),
        ],
        currentIndex: appCubit.currentIndex,
        backgroundColor:
            appCubit.isDarkTheme ? Colors.grey[800] : Colors.blue[50],
        iconSize: 35,
        selectedItemColor: Colors.tealAccent,
        unselectedItemColor: Colors.white,
        onTap: (value) {
          setState(() {
            appCubit.currentIndex = value;
          });
        },
      ),
      backgroundColor: appCubit.getBackgroundColor(),
      body: pages[appCubit.currentIndex],
    );
  }
}

class HomePageColumn extends StatelessWidget {
  const HomePageColumn({
    Key? key,
    required this.appCubit,
    required this.transactions,
  }) : super(key: key);

  final AppCubit appCubit;
  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CurvedAppBar(
            widget: WelcomeBar(appCubit: appCubit),
            height: 300,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: TotalExpensesCard(appCubit: appCubit),
              ),
              const SizedBox(height: 20),
              const Center(
                child: PieChartCard(),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: Text(
                  "Recent Transactions",
                  style: subTitleStyle,
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
                itemCount: appCubit.getTransactions().length,
                itemBuilder: (context, i) {
                  return SizedBox(
                    height: 100,
                    width: 400,
                    child: Card(
                      color: Colors.grey[900],
                      elevation: 10,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Icon(
                                transactions[i].category.icon ??
                                    Icons.shopping_cart_outlined,
                                size: 35,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              transactions[i].name,
                              overflow: TextOverflow.ellipsis,
                              style: subTitleStyle,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              transactions[i].amount.toStringAsFixed(2),
                              style: subTitleStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class WelcomeBar extends StatelessWidget {
  const WelcomeBar({
    Key? key,
    required this.appCubit,
  }) : super(key: key);

  final AppCubit appCubit;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const NotificationsPage()));
            },
            icon: const Icon(Icons.notifications_outlined),
            color: Colors.white,
            iconSize: 45,
          ),
          top: 70,
          left: 330,
        ),
        Positioned(
            left: 10,
            top: 25,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(
                        user: appCubit.user,
                        useBack: true,
                      ),
                    ));
              },
              child: CircleAvatar(
                radius: 35,
                backgroundImage: (appCubit.user.avatar != null)
                    ? Image.memory(
                        appCubit.user.avatar!,
                        fit: BoxFit.fitWidth,
                      ).image
                    : null,
                backgroundColor: Colors.teal,
              ),
            )),
        const Positioned(
          top: 100,
          left: 10,
          child: Text(
            "Welcome",
            style: subTitleStyle,
          ),
        ),
        Positioned(
          top: 130,
          left: 8,
          child: Text(
            appCubit.user.name,
            style: titleStyleWhite,
          ),
        ),
        const Positioned(
            top: 180,
            left: 30,
            child: Text(
              "Your expenses\nchanged by",
              style: subHeadStyleWhite,
            )),
        Positioned(
          top: 170,
          left: 250,
          child: Text(
            (appCubit.getExpensesChangeRatio() > 0)
                ? "+${appCubit.getExpensesChangeRatio().toStringAsFixed(0)}%"
                : "-${appCubit.getExpensesChangeRatio().toStringAsFixed(0)}%",
            style: const TextStyle(
              fontSize: 40,
              color: Colors.redAccent,
              fontFamily: "Merriweather",
            ),
          ),
        ),
        const Positioned(
          top: 215,
          left: 220,
          child: Text(
            "since last month",
            style: subTitleStyle,
          ),
        ),
      ],
    );
  }
}

class PieChartCard extends StatelessWidget {
  const PieChartCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 380,
      height: 340,
      child: Card(
        elevation: 10,
        color: Colors.grey[850],
        child: Column(
          children: [
            const Text(
              "Daily Expenses",
              style: subHeadStyleWhite,
            ),
            DailyExpensesPieChart()
          ],
        ),
      ),
    );
  }
}

class TotalExpensesCard extends StatelessWidget {
  const TotalExpensesCard({
    Key? key,
    required this.appCubit,
  }) : super(key: key);

  final AppCubit appCubit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 380,
      height: 100,
      child: Card(
        margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
        color: Colors.grey[850],
        elevation: 10,
        child: Column(
          children: [
            const Text(
              "Expenses this month",
              style: subTitleStyle,
            ),
            Text(
              "${appCubit.getTotalExpenses().toStringAsFixed(2)} SAR",
              style: titleStyleWhite,
            ),
          ],
        ),
      ),
    );
  }
}
