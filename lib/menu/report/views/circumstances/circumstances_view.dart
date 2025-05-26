import 'package:constatn/menu/report/bloc/update_report_cubit/update_report_cubit.dart';
import 'package:constatn/menu/report/managers/report_manager.dart';
import 'package:constatn/menu/report/utils/enums/report_step.dart';
import 'package:constatn/menu/report/widgets/vehicle_type_widget.dart';
import 'package:constatn/shared/constants/app_constants.dart';
import 'package:constatn/shared/dependency_injection/app_component.dart';
import 'package:constatn/shared/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CircumstancesView extends StatefulWidget {
  const CircumstancesView({
    super.key,
  });

  @override
  State<CircumstancesView> createState() => _CircumstancesViewState();
}

class _CircumstancesViewState extends State<CircumstancesView> {
  List<bool> leftChecked = List.filled(17, false);
  final Set<String> selectedFirstVehicle = {};
  final Set<String> selectedSecondVehicle = {};
  final List<String> labels = [
    "En stationnement",
    "Quittait un stationnement",
    "Prenait un stationnement",
    "Sortait d'un parking, d'un lieu privé, d'un chemin de terre",
    "S'engageait dans un parking, un lieu privé, un chemin de terre",
    "Arrêt de circulation",
    "Frottement sans changement de file",
    "Heurtait à l’arrière, en roulant dans le même sens",
    "Roulait dans le même sens et sur une file différente",
    "Changement de file",
    "Doublait",
    "Virait à droite",
    "Virait à gauche",
    "Reculait",
    "Empiétait sur la chaussée en sens inverse",
    "Venait de droite (dans un carrefour)",
    "N'avait pas observé le signal de priorité",
  ];

  @override
  Widget build(BuildContext context) {
    final updateReportCubit = context.read<UpdateReportCubit>();
    final reportManager = locator<ReportManager>();
    var vehicles = reportManager.vehicles ?? [];
    bool isDual = vehicles.length > 1;
    return Container(
      padding: const EdgeInsets.all(16),
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: vehicles
                      .asMap()
                      .entries
                      .map(
                        (entry) => VehicleTypeWidget(
                          vehicleName: entry.value.vehicleName,
                          vehicleBgColor: entry.value.vehicleBgColor,
                          reverse: entry.key == vehicles.length - 1,
                        ),
                      )
                      .toList(),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    child: ListView.builder(
                      itemCount: labels.length,
                      shrinkWrap: true,
                      itemBuilder: (_, index) {
                        final label = labels[index];

                        return isDual
                            ? Row(
                                children: [
                                  Checkbox(
                                    activeColor: primaryColor,
                                    value: selectedFirstVehicle.contains(label),
                                    onChanged: (val) {
                                      setState(() {
                                        if (val == true) {
                                          selectedFirstVehicle.add(label);
                                        } else {
                                          selectedFirstVehicle.remove(label);
                                        }
                                      });
                                    },
                                  ),
                                  Expanded(
                                    child: Text(
                                      label,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                  ),
                                  Checkbox(
                                    activeColor: primaryColor,
                                    value:
                                        selectedSecondVehicle.contains(label),
                                    onChanged: (val) {
                                      setState(() {
                                        if (val == true) {
                                          selectedSecondVehicle.add(label);
                                        } else {
                                          selectedSecondVehicle.remove(label);
                                        }
                                      });
                                    },
                                  ),
                                ],
                              )
                            : Row(
                                children: [
                                  Checkbox(
                                    activeColor: primaryColor,
                                    value: vehicles.length == 1
                                        ? selectedFirstVehicle.contains(label)
                                        : selectedSecondVehicle.contains(label),
                                    onChanged: (val) {
                                      setState(() {
                                        if (val == true) {
                                          vehicles.length == 1
                                              ? selectedFirstVehicle.add(label)
                                              : selectedSecondVehicle
                                                  .add(label);
                                        } else {
                                          vehicles.length == 1
                                              ? selectedFirstVehicle
                                                  .remove(label)
                                              : selectedSecondVehicle
                                                  .remove(label);
                                        }
                                      });
                                    },
                                  ),
                                  Expanded(
                                    child: Text(
                                      label,
                                      style: const TextStyle(fontSize: 14),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                ],
                              );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
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
                  onPressed:
                      (vehicles.length == 1 && selectedFirstVehicle.isEmpty) ||
                              (vehicles.length > 1 &&
                                  (selectedFirstVehicle.isEmpty ||
                                      selectedSecondVehicle.isEmpty))
                          ? null
                          : () {
                              final updatedVehicles =
                                  vehicles.asMap().entries.map((entry) {
                                final index = entry.key;
                                final vehicle = entry.value;
                                final selectedList = index == 0
                                    ? selectedFirstVehicle
                                    : selectedSecondVehicle;
                                return vehicle.copyWith(
                                  circumstances: selectedList.toList(),
                                );
                              }).toList();
                              reportManager.vehicles = updatedVehicles;
                              updateReportCubit.updateReportStep(
                                newStep: ReportStep.circumstancesRecap,
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
