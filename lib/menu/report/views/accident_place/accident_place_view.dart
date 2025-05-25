import 'package:constatn/menu/report/bloc/update_report_cubit/update_report_cubit.dart';
import 'package:constatn/menu/report/domain/entities/vehicle_data_entity.dart';
import 'package:constatn/menu/report/managers/report_manager.dart';
import 'package:constatn/menu/report/utils/enums/report_step.dart';
import 'package:constatn/menu/report/views/accident_place/add_accident_place_view.dart';
import 'package:constatn/menu/report/widgets/accident_place_card_widget.dart';
import 'package:constatn/shared/constants/app_constants.dart';
import 'package:constatn/shared/dependency_injection/app_component.dart';
import 'package:constatn/shared/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccidentPlaceView extends StatefulWidget {
  const AccidentPlaceView({super.key});

  @override
  State<AccidentPlaceView> createState() => _AccidentPlaceViewState();
}

class _AccidentPlaceViewState extends State<AccidentPlaceView> {
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
                  child: AccidentPlaceCardWidget(
                    vehicleDataEntity: vehicles[index],
                    onClicked: () {
                      Navigator.push<List<VehicleDataEntity>?>(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddAccidentPlaceView(
                            vehicleDataEntity: vehicles[index],
                          ),
                        ),
                      ).then((value) {
                        setState(() {
                          vehicles = value ?? [];
                        });
                      });
                    },
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
                  updateReportCubit.updateReportStep(
                    newStep: ReportStep.contracts,
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
                  onPressed: vehicles.any(
                          (element) => element.vehicleAccidentPlace == null)
                      ? null
                      : () {},
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
