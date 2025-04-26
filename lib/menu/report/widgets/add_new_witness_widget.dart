import 'package:constatn/menu/report/utils/enums/report_step.dart';
import 'package:constatn/shared/constants/app_constants.dart';
import 'package:constatn/shared/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/update_report_cubit/update_report_cubit.dart';

class AddNewWitnessWidget extends StatelessWidget {
  const AddNewWitnessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final updateReportCubit = context.read<UpdateReportCubit>();
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 4,
        vertical: 16,
      ),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: secondaryColor.shade200,
                  ),
                ),
                alignment: Alignment.bottomCenter,
                child: Icon(
                  Icons.person_rounded,
                  color: secondaryColor,
                  size: 24,
                ),
              ),
              Row(
                children: [
                  Text(
                    'Ajouter un témoin',
                    style: TextStyle(
                      fontFamily: kGlacialStyle,
                      color: secondaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      updateReportCubit.updateReportStep(
                          newStep: ReportStep.addNewWitness);
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        left: 10,
                      ),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: primaryColor),
                      alignment: Alignment.bottomCenter,
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
            ),
            child: Divider(
              height: 0.4,
              thickness: 0.4,
              color: secondaryColor.shade300,
            ),
          ),
        ],
      ),
    );
  }
}
