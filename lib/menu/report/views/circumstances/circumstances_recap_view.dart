import 'package:constatn/menu/report/bloc/update_report_cubit/update_report_cubit.dart';
import 'package:constatn/menu/report/managers/report_manager.dart';
import 'package:constatn/menu/report/utils/enums/report_step.dart';
import 'package:constatn/menu/report/widgets/circumstance_card_widget.dart';
import 'package:constatn/shared/constants/app_constants.dart';
import 'package:constatn/shared/dependency_injection/app_component.dart';
import 'package:constatn/shared/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CircumstancesRecapView extends StatelessWidget {
  const CircumstancesRecapView({super.key});

  @override
  Widget build(BuildContext context) {
    final updateReportCubit = context.read<UpdateReportCubit>();
    final reportManager = locator<ReportManager>();
    var vehicles = reportManager.vehicles ?? [];
    return Container(
      padding: const EdgeInsets.all(16),
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: vehicles.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: CircumstanceCardWidget(
                    vehicleDataEntity: vehicles[index],
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  final updatedVehicles = vehicles.asMap().entries.map((entry) {
                    final vehicle = entry.value;
                    return vehicle.copyWith(
                      circumstances: null,
                    );
                  }).toList();
                  reportManager.vehicles = updatedVehicles;
                  updateReportCubit.updateReportStep(
                    newStep: ReportStep.accidentPlace,
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
                    /* updateReportCubit.updateReportStep(
                      newStep: ReportStep.dateHourAccident,
                    );

                    */
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
                    "Suivant",
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
        ],
      ),
    );
  }
}
