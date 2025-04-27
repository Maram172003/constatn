import 'package:constatn/menu/report/domain/entities/vehicle_data_entity.dart';
import 'package:constatn/menu/report/managers/report_manager.dart';
import 'package:constatn/menu/report/widgets/vehicle_type_widget.dart';
import 'package:constatn/shared/constants/app_constants.dart';
import 'package:constatn/shared/dependency_injection/app_component.dart';
import 'package:constatn/shared/values/app_colors.dart';
import 'package:flutter/material.dart';

class AddVehicleInsuranceView extends StatelessWidget {
  const AddVehicleInsuranceView({
    super.key,
    required this.vehicleDataEntity,
  });

  final VehicleDataEntity vehicleDataEntity;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final insuranceController =
        TextEditingController(text: vehicleDataEntity.insuranceName);
    final registrationController =
        TextEditingController(text: vehicleDataEntity.carRegistrationNumber);
    final reportManager = locator<ReportManager>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Assurances et immatriculations',
            style: TextStyle(
              fontFamily: kGlacialStyle,
              color: secondaryColor,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  8,
                ),
              ),
              border: Border.all(
                color: secondaryColor.shade200,
              ),
            ),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  VehicleTypeWidget(
                    vehicleName: vehicleDataEntity.vehicleName,
                    vehicleBgColor: vehicleDataEntity.vehicleBgColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                    ),
                    child: TextFormField(
                      controller: insuranceController,
                      decoration: InputDecoration(
                        labelText: 'Assurance*',
                        labelStyle: TextStyle(
                          fontFamily: kGlacialStyle,
                          color: primaryColor,
                          fontSize: 16,
                        ),
                        hintStyle: TextStyle(
                          color: secondaryColor.shade300,
                          fontFamily: kGlacialStyle,
                          fontSize: 16,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        prefixIconConstraints: const BoxConstraints(
                          maxWidth: 165,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 8,
                        ),
                        hintText: "AXA France",
                      ),
                      validator: (value) {
                        if ((value == null || value.trim().isEmpty)) {
                          return "Ce champ est requis";
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(
                      12,
                    ),
                    color: Colors.yellow[100],
                    child: Row(
                      children: [
                        Icon(
                          Icons.lightbulb_outline,
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 10,
                            ),
                            child: Text(
                                "Le nom de votre assureur se trouve sur votre Mémo Véhicule Assuré ou dans la case 10 de votre carte verte"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                    ),
                    child: TextFormField(
                      controller: registrationController,
                      decoration: InputDecoration(
                        labelText: 'Immatriculations*',
                        labelStyle: TextStyle(
                          fontFamily: kGlacialStyle,
                          color: primaryColor,
                          fontSize: 16,
                        ),
                        hintStyle: TextStyle(
                          color: secondaryColor.shade300,
                          fontFamily: kGlacialStyle,
                          fontSize: 16,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        prefixIconConstraints: const BoxConstraints(
                          maxWidth: 165,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 8,
                        ),
                        hintText: "1234 AB 74",
                      ),
                      validator: (value) {
                        if ((value == null || value.trim().isEmpty)) {
                          return "Ce champ est requis";
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(
                      12,
                    ),
                    color: Colors.yellow[100],
                    child: Row(
                      children: [
                        Icon(
                          Icons.lightbulb_outline,
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 10,
                            ),
                            child: Text(
                              "Voiture : 1234 AB 75, AA-123-AA\nCyclo: AA 123 A",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).pop();
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
              onPressed: () {
                if (formKey.currentState != null &&
                    formKey.currentState!.validate()) {
                  final managerVehicles = reportManager.vehicles;
                  final vehicleToUpdateIndex = managerVehicles?.indexWhere(
                    (element) => element.docId == vehicleDataEntity.docId,
                  );
                  if (vehicleToUpdateIndex != null &&
                      vehicleToUpdateIndex != -1) {
                    managerVehicles
                      ?..removeAt(vehicleToUpdateIndex)
                      ..insert(
                        vehicleToUpdateIndex,
                        vehicleDataEntity.copyWith(
                          insurance: insuranceController.text,
                          registrationNumber: registrationController.text,
                        ),
                      );
                    reportManager.vehicles = managerVehicles;
                  }
                  Navigator.of(context).pop(reportManager.vehicles);
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
                "Valider",
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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
