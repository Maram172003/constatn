import 'package:constatn/menu/report/bloc/update_report_cubit/update_report_cubit.dart';
import 'package:constatn/menu/report/utils/enums/report_step.dart';
import 'package:constatn/shared/constants/app_constants.dart';
import 'package:constatn/shared/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecapView extends StatelessWidget {
  const RecapView({super.key});

  @override
  Widget build(BuildContext context) {
    final updateReportCubit = context.read<UpdateReportCubit>();
    return Container(
      padding: const EdgeInsets.all(16),
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              'assets/images/recap.jpeg',
              height: MediaQuery.of(context).size.height * .8,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    updateReportCubit.updateReportStep(
                      newStep: ReportStep.circumstancesRecap,
                    );
                  },
                  child: Text(
                    "Retour",
                    style: TextStyle(
                      fontFamily: kGlacialStyle,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      updateReportCubit.updateReportStep(
                        newStep: ReportStep.sign,
                      );
                    },
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
                      "Valider",
                      style: TextStyle(
                        fontFamily: kGlacialStyle,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
