import 'package:constatn/menu/report/bloc/update_report_cubit/update_report_cubit.dart';
import 'package:constatn/menu/report/managers/report_manager.dart';
import 'package:constatn/menu/report/utils/enums/input_mode_type.dart';
import 'package:constatn/menu/report/utils/enums/report_step.dart';
import 'package:constatn/menu/report/widgets/vehicle_type_widget.dart';
import 'package:constatn/shared/constants/app_constants.dart';
import 'package:constatn/shared/dependency_injection/app_component.dart';
import 'package:constatn/shared/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ObservationView extends StatefulWidget {
  const ObservationView({super.key});

  @override
  State<ObservationView> createState() => _ObservationViewState();
}

class _ObservationViewState extends State<ObservationView> {
  late ReportManager reportManager;
  bool isSelectingSecondVehicle = false;
  late TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    reportManager = locator<ReportManager>();
  }

  void _addVehicleObservation(String docId) {
    final vehicles = reportManager.vehicles ?? [];
    final vehicleIndex =
        vehicles.indexWhere((element) => element.docId == docId);
    if (vehicleIndex != -1) {
      vehicles[vehicleIndex] = vehicles[vehicleIndex].copyWith(
        observation: textEditingController.text,
      );
    }
    reportManager.vehicles = vehicles;
  }

  @override
  Widget build(BuildContext context) {
    final updateReportCubit = context.read<UpdateReportCubit>();
    final vehicles = reportManager.vehicles ?? [];

    final currentVehicle = isSelectingSecondVehicle && vehicles.length == 2
        ? vehicles[1]
        : vehicles[0];

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final existingObservation = currentVehicle.observationDescription ?? "";
      if (textEditingController.text != existingObservation) {
        textEditingController.text = existingObservation;
      }
    });

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16).copyWith(
        top: 20,
      ),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VehicleTypeWidget(
                    vehicleName:
                        isSelectingSecondVehicle ? 'Véhicule B' : 'Véhicule A',
                    vehicleBgColor:
                        isSelectingSecondVehicle ? Colors.amber : primaryColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 16,
                      top: 16,
                    ),
                    child: Text(
                      'Ajoutez des précisions sur l\'accident ',
                      style: TextStyle(
                        fontFamily: kGlacialStyle,
                        color: secondaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                    ),
                    child: TextField(
                      maxLines: 3,
                      controller: textEditingController,
                      decoration: InputDecoration(
                        hintText: "Commentaire (optionnel)",
                        hintStyle: TextStyle(
                          fontFamily: kGlacialStyle,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: secondaryColor,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            8,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (!isSelectingSecondVehicle &&
                        reportManager.inputModeType ==
                            InputModeType.twoDriversOneSmartphone &&
                        vehicles.length == 2) {
                      _addVehicleObservation(vehicles[0].docId);
                      setState(() {
                        isSelectingSecondVehicle = true;
                        textEditingController.clear();
                      });
                    } else {
                      final docId =
                          (vehicles.length == 2 && isSelectingSecondVehicle)
                              ? vehicles[1].docId
                              : vehicles[0].docId;

                      _addVehicleObservation(docId);

                      updateReportCubit.updateReportStep(
                        newStep: ReportStep.sign,
                      );
                    }
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
