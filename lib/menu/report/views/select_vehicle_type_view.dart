import 'package:constatn/menu/report/bloc/update_report_cubit/update_report_cubit.dart';
import 'package:constatn/menu/report/managers/report_manager.dart';
import 'package:constatn/menu/report/utils/enums/input_mode_type.dart';
import 'package:constatn/menu/report/utils/enums/report_step.dart';
import 'package:constatn/menu/report/utils/enums/vehicle_type.dart';
import 'package:constatn/menu/report/widgets/input_mode_widget.dart';
import 'package:constatn/menu/report/widgets/vehicle_type_widget.dart';
import 'package:constatn/shared/constants/app_constants.dart';
import 'package:constatn/shared/dependency_injection/app_component.dart';
import 'package:constatn/shared/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectVehicleTypeView extends StatefulWidget {
  const SelectVehicleTypeView({super.key});

  @override
  State<SelectVehicleTypeView> createState() => _SelectVehicleTypeViewState();
}

class _SelectVehicleTypeViewState extends State<SelectVehicleTypeView> {
  late ReportManager reportManager;
  VehicleType? selectedVehicleType;
  bool isSelectingSecondVehicle = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    reportManager = locator<ReportManager>();
  }

  @override
  Widget build(BuildContext context) {
    final updateReportCubit = context.read<UpdateReportCubit>();
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
      ).copyWith(
        top: 20,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VehicleTypeWidget(
              vehicleName: isSelectingSecondVehicle ? 'Véhicle B' : 'Véhicle A',
              vehicleBgColor:
                  isSelectingSecondVehicle ? Colors.amber : primaryColor,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 25,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InputModeWidget(
                    inputModeIllustration: 'assets/images/car.jpg',
                    isEnabled: selectedVehicleType == VehicleType.car,
                    description: 'Voiture\n',
                    onChecked: (bool value) {
                      setState(() {
                        selectedVehicleType = value ? VehicleType.car : null;
                      });
                    },
                  ),
                  InputModeWidget(
                    inputModeIllustration: 'assets/images/van.jpg',
                    isEnabled: selectedVehicleType == VehicleType.truck,
                    description: 'Camion\ncamionnette',
                    onChecked: (bool value) {
                      setState(() {
                        selectedVehicleType = value ? VehicleType.truck : null;
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 25,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InputModeWidget(
                    inputModeIllustration: 'assets/images/moto.jpg',
                    isEnabled: selectedVehicleType == VehicleType.motorcycle,
                    description: 'Deux-roues\nmotorisés',
                    onChecked: (bool value) {
                      setState(() {
                        selectedVehicleType =
                            value ? VehicleType.motorcycle : null;
                      });
                    },
                  ),
                  InputModeWidget(
                    inputModeIllustration: 'assets/images/bike.jpeg',
                    isEnabled: selectedVehicleType == VehicleType.bicycle,
                    description: 'Vélo\nVélo électrique',
                    onChecked: (bool value) {
                      setState(() {
                        selectedVehicleType =
                            value ? VehicleType.bicycle : null;
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * .03,
                bottom: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      updateReportCubit.updateReportStep(
                        newStep: ReportStep.addWitnesses,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 18,
                      ),
                    ),
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
                  ElevatedButton(
                    onPressed: selectedVehicleType != null
                        ? () {
                            if (!isSelectingSecondVehicle &&
                                reportManager.inputModeType ==
                                    InputModeType.twoDriversOneSmartphone) {
                              // First vehicle selected, now move to select second vehicle
                              reportManager.firstVehicleType =
                                  selectedVehicleType;
                              setState(() {
                                selectedVehicleType = null;
                                isSelectingSecondVehicle = true;
                              });
                            } else {
                              reportManager.firstVehicleType =
                                  selectedVehicleType;
                            }
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
