import 'package:constatn/authentication/login_view.dart';
import 'package:constatn/authentication/signup_view.dart';
import 'package:constatn/menu/report/views/report_steps_view.dart';
import 'package:constatn/shared/dependency_injection/app_component.dart';
import 'package:constatn/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'menu/report/bloc/update_report_cubit/update_report_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initAppComponentLocator();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UpdateReportCubit>(
      create: (BuildContext context) => locator<UpdateReportCubit>(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: {
          "/": (context) => const Welcome(),
          "/login": (context) => const LoginView(),
          "/signup": (context) => const SignupView(),
          "/reportSteps": (context) => const ReportStepsView(),
        },
      ),
    );
  }
}
