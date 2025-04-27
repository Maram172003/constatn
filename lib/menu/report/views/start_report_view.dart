import 'package:constatn/menu/report/managers/report_manager.dart';
import 'package:constatn/menu/report/utils/enums/input_mode_type.dart';
import 'package:constatn/menu/report/widgets/input_mode_widget.dart';
import 'package:constatn/shared/constants/app_constants.dart';
import 'package:constatn/shared/dependency_injection/app_component.dart';
import 'package:constatn/shared/values/app_colors.dart';
import 'package:flutter/material.dart';

class StartReportView extends StatefulWidget {
  const StartReportView({super.key});

  @override
  State<StartReportView> createState() => _StartReportViewState();
}

class _StartReportViewState extends State<StartReportView> {
  late ReportManager reportManager;
  InputModeType? selectedInputMode;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    reportManager = locator<ReportManager>();
    selectedInputMode = reportManager.inputModeType;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (_, __) {
        reportManager.clear();
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: secondaryColor,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            title: Text(
              'Mode de saisie',
              style: TextStyle(
                fontFamily: kGlacialStyle,
                color: secondaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 25,
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
            ).copyWith(
              top: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InputModeWidget(
                      inputModeIllustration:
                          'assets/images/two_drivers_one_smartphone.jpg',
                      isEnabled: selectedInputMode ==
                          InputModeType.twoDriversOneSmartphone,
                      description: '2 conducteurs\n1 Smartphone',
                      onChecked: (bool value) {
                        setState(() {
                          selectedInputMode = value
                              ? InputModeType.twoDriversOneSmartphone
                              : null;
                        });
                      },
                    ),
                    InputModeWidget(
                      inputModeIllustration:
                          'assets/images/one_driver_one_smartphone.jpg',
                      isEnabled: selectedInputMode ==
                          InputModeType.oneDriverOneSmartphone,
                      description: '1 conducteur\n1 Smartphone',
                      onChecked: (bool value) {
                        setState(() {
                          selectedInputMode = value
                              ? InputModeType.oneDriverOneSmartphone
                              : null;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          floatingActionButton: ElevatedButton(
            onPressed: selectedInputMode != null
                ? () {
                    reportManager.clear();
                    reportManager.inputModeType = selectedInputMode;
                    Navigator.pushNamed(context, "/reportSteps");
                  }
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              disabledBackgroundColor: secondaryColor.shade200,
              padding: const EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 18,
              ),
            ),
            child: Text(
              "Suivant",
              style: TextStyle(
                fontFamily: kGlacialStyle,
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        ),
      ),
    );
  }
}
