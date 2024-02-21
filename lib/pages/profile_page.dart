import 'package:chronos/components/buttons/logout_button.dart';
import 'package:chronos/components/curved_appbar.dart';
import 'package:chronos/const.dart';
import 'package:chronos/cubits/app_cubit.dart';
import 'package:chronos/models/user.dart';
import 'package:chronos/pages/personal_information_page.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key, required this.useBack, required this.user})
      : super(key: key);
  bool useBack;
  User user;
  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = AppCubit.get(context);
    return Scaffold(
      backgroundColor: appCubit.getBackgroundColor(),
      body: Column(
        children: [
          CurvedAppBar(
            title: "Profile",
            height: 180,
            isBackButton: useBack,
          ),
          const SizedBox(height: 40),
          SizedBox(
            height: 180,
            width: MediaQuery.of(context).size.width * .9,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              color: appCubit.isDarkTheme ? Colors.blueGrey[700] : Colors.white,
              child: Column(
                children: [
                  ProfileCardWidget(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PersonalInformationPage(
                                  // user: appCubit.user,
                                  ),
                            ));
                      },
                      appCubit: appCubit,
                      title: "Personal Information",
                      icon: Icons.person_outline),
                  ProfileCardWidget(
                      onPressed: () {},
                      appCubit: appCubit,
                      icon: Icons.apartment_outlined,
                      title: "Bank Accounts"),
                ],
              ),
              elevation: 10,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 180,
            width: MediaQuery.of(context).size.width * .9,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              color: appCubit.isDarkTheme ? Colors.blueGrey[700] : Colors.white,
              child: Column(
                children: [
                  ProfileCardWidget(
                      appCubit: appCubit,
                      onPressed: () {},
                      title: "Language",
                      icon: Icons.language_outlined),
                  ProfileCardWidget(
                      onPressed: () {},
                      appCubit: appCubit,
                      icon: Icons.support_agent_outlined,
                      title: "Support"),
                ],
              ),
              elevation: 10,
            ),
          ),
          const SizedBox(height: 40),
          SizedBox(
            width: MediaQuery.of(context).size.width * .8,
            child: LogoutButton(
              elevation: true,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileCardWidget extends StatelessWidget {
  ProfileCardWidget({
    Key? key,
    required this.appCubit,
    required this.title,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);
  String title;
  IconData icon;
  Function() onPressed;
  final AppCubit appCubit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 80,
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        margin: const EdgeInsets.all(8),
        color: appCubit.isDarkTheme ? Colors.blueGrey[900] : Colors.white,
        elevation: 10,
        child: IconButton(
          onPressed: onPressed,
          icon: Row(
            children: [
              Expanded(
                flex: 1,
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Text(
                    title,
                    style: subTitleStyle,
                  )),
              const Expanded(
                flex: 1,
                child: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
