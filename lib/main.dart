import 'package:constatn/authentication/login_view.dart';
import 'package:constatn/authentication/signup_view.dart';
import 'package:constatn/menu/report/views/report_steps_view.dart';
import 'package:constatn/shared/dependency_injection/app_component.dart';
import 'package:constatn/welcome.dart';
import 'package:flutter/material.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => const Welcome(),
        "/login": (context) => const LoginView(),
        "/signup": (context) => const SignupView(),
        "/reportSteps": (context) => const ReportStepsView(),
      },
    );
  }
}
