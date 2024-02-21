import 'dart:io';
import 'package:chronos/cubits/app_cubit.dart';
import 'package:chronos/pages/home_page.dart';
import 'package:chronos/pages/login_page.dart';
import 'package:chronos/pages/loan_page.dart';
import 'package:chronos/services/dio_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  HttpOverrides.global = MyHttpOverrides(); // TODO : remove this
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppCubit>(
      create: (context) => AppCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/login',
        routes: {
          '/login': (context) => const LoginPage(),
          '/home': (context) => const HomePage(),
          '/loan': (context) => const LoanPage(),
          '/login': (context) => const LoginPage(),
        },
      ),
    );
  }
}
