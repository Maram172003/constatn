import 'package:constatn/menu/home_view.dart';
import 'package:constatn/shared/values/app_colors.dart';
import 'package:flutter/material.dart';

import '../shared/constants/app_constants.dart';

class ReportSuccessView extends StatelessWidget {
  const ReportSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'E-constat finalisé',
                style: TextStyle(
                  fontFamily: kGlacialStyle,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: secondaryColor,
                ),
              ),
              Expanded(
                child: Center(
                  child: Image.asset(
                    'assets/images/issue_reported.webp',
                    height: MediaQuery.of(context).size.height * .35,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(16),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeView(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: secondaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    disabledBackgroundColor: secondaryColor.shade200,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 18,
                    ),
                  ),
                  child: Text(
                    "OK",
                    style: TextStyle(
                      fontFamily: kGlacialStyle,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
