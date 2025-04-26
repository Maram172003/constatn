import 'package:constatn/menu/report/bloc/update_report_cubit/update_report_cubit.dart';
import 'package:constatn/menu/report/managers/report_manager.dart';
import 'package:constatn/menu/report/widgets/add_new_witness_widget.dart';
import 'package:constatn/menu/report/widgets/created_witness_widget.dart';
import 'package:constatn/shared/constants/app_constants.dart';
import 'package:constatn/shared/dependency_injection/app_component.dart';
import 'package:constatn/shared/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddingWitnessesView extends StatelessWidget {
  const AddingWitnessesView({super.key});

  @override
  Widget build(BuildContext context) {
    final reportManager = locator<ReportManager>();
    var witnesses = reportManager.witnesses ?? [];
    return BlocConsumer<UpdateReportCubit, UpdateReportState>(
      listener: (BuildContext context, UpdateReportState state) {
        if (state is UpdateWitnessesWithSuccess) {
          witnesses = state.witnesses;
        }
      },
      builder: (BuildContext context, UpdateReportState state) {
        return Container(
          padding: const EdgeInsets.all(16),
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                ),
                child: Text(
                  "Vous pouvez ajouter jusqu'à 4 témoins pour compléter votre e-constat.",
                  style: TextStyle(
                    fontFamily: kGlacialStyle,
                    color: secondaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: witnesses.length + 1,
                  // one extra for AddNewWitnessWidget
                  itemBuilder: (BuildContext context, int index) {
                    if (index == witnesses.length) {
                      // After all witnesses, show "Add New"
                      return AddNewWitnessWidget();
                    } else {
                      // Show existing witness
                      return CreatedWitnessWidget(
                        witnessEntity: witnesses[index],
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
