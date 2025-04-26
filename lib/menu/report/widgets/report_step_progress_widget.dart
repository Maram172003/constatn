import 'package:constatn/shared/values/app_colors.dart';
import 'package:flutter/material.dart';

class ReportStepProgressWidget extends StatelessWidget {
  const ReportStepProgressWidget({
    super.key,
    required this.currentStep,
  });

  final double currentStep;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20,
      height: 20,
      child: CircularProgressIndicator(
        color: primaryColor.shade500,
        backgroundColor: secondaryColor.shade100,
        value: currentStep / 7,
      ),
    );
  }
}
