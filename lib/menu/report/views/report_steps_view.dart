import 'package:constatn/menu/report/bloc/update_report_cubit/update_report_cubit.dart';
import 'package:constatn/menu/report/utils/enums/report_step.dart';
import 'package:constatn/menu/report/views/add_new_witness_view.dart';
import 'package:constatn/menu/report/views/adding_witnesses_view.dart';
import 'package:constatn/menu/report/views/select_vehicle_type_view.dart';
import 'package:constatn/menu/report/widgets/report_step_progress_widget.dart';
import 'package:constatn/shared/constants/app_constants.dart';
import 'package:constatn/shared/dependency_injection/app_component.dart';
import 'package:constatn/shared/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportStepsView extends StatelessWidget {
  const ReportStepsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UpdateReportCubit>(
      create: (BuildContext context) => locator<UpdateReportCubit>(),
      child: _ReportStepsView(),
    );
  }
}

class _ReportStepsView extends StatelessWidget {
  const _ReportStepsView();

  @override
  Widget build(BuildContext context) {
    ReportStep reportStep = ReportStep.addWitnesses;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocConsumer<UpdateReportCubit, UpdateReportState>(
            listener: (BuildContext context, UpdateReportState state) {
          if (state is UpdateReportStepWithSuccess) {
            reportStep = state.reportStep;
          }
        }, builder: (BuildContext context, UpdateReportState state) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (reportStep == ReportStep.addWitnesses)
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: secondaryColor,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    Text(
                      reportStep.headerTitle,
                      style: TextStyle(
                        fontFamily: kGlacialStyle,
                        color: secondaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    ReportStepProgressWidget(
                      currentStep: reportStep.step,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Builder(
                    builder: (BuildContext context) {
                      switch (reportStep) {
                        case ReportStep.addWitnesses:
                          return AddingWitnessesView();
                        case ReportStep.selectVehicleType:
                          return SelectVehicleTypeView();
                        case ReportStep.addNewWitness:
                          return AddNewWitnessView();
                        case ReportStep.contracts:
                        case ReportStep.accidentPlace:
                        case ReportStep.circumstances:
                        case ReportStep.dateHourAccident:
                        case ReportStep.sketch:
                        case ReportStep.observations:
                        case ReportStep.sign:
                          return SizedBox.shrink();
                      }
                    },
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
