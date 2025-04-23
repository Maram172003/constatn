import 'package:constatn/authentication/login_view.dart';
import 'package:constatn/authentication/signup_view.dart';
import 'package:constatn/welcome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => const Welcome(),
        "/login": (context) => const LoginView(),
        "/signup": (context) => const SignupView(),
      },
    );
  }
}
