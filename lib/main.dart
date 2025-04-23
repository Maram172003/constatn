import 'package:constatn/authentication/login_view.dart';
import 'package:constatn/authentication/signup_view.dart';
import 'package:constatn/welcome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
      },
    );
  }
}
