import 'package:constatn/menu/report/domain/entities/vehicle_contract_entity.dart';
import 'package:constatn/menu/report/domain/entities/vehicle_data_entity.dart';
import 'package:constatn/menu/report/managers/report_manager.dart';
import 'package:constatn/menu/report/widgets/vehicle_type_widget.dart';
import 'package:constatn/shared/constants/app_constants.dart';
import 'package:constatn/shared/dependency_injection/app_component.dart';
import 'package:constatn/shared/values/app_colors.dart';
import 'package:flutter/material.dart';

class AddVehicleContractView extends StatefulWidget {
  const AddVehicleContractView({
    super.key,
    required this.vehicleDataEntity,
  });

  final VehicleDataEntity vehicleDataEntity;

  @override
  State<AddVehicleContractView> createState() => _AddVehicleContractViewState();
}

class _AddVehicleContractViewState extends State<AddVehicleContractView> {
  final _formkey = GlobalKey<FormState>();
  late TextEditingController _contractNumberController;

  late TextEditingController _insuredNameController;

  late TextEditingController _insuredLastNameController;

  late TextEditingController _insuredAdresseController;

  late TextEditingController _driverNameController;

  late TextEditingController _driverLastNameController;

  late TextEditingController _driverAdresseController;
  late TextEditingController _licenseNumberController;

  @override
  void initState() {
    final contract = widget.vehicleDataEntity.vehicleContractEntity;
    _contractNumberController =
        TextEditingController(text: contract?.contractNumber ?? '');
    _insuredNameController =
        TextEditingController(text: contract?.insuredFirstName ?? '');
    _insuredLastNameController =
        TextEditingController(text: contract?.insuredLastName ?? '');
    _driverNameController =
        TextEditingController(text: contract?.driverFirstName ?? '');
    _driverLastNameController =
        TextEditingController(text: contract?.driverLastName ?? '');
    _driverAdresseController =
        TextEditingController(text: contract?.driverAddress ?? '');
    _insuredAdresseController =
        TextEditingController(text: contract?.insuredAddress ?? '');
    _licenseNumberController =
        TextEditingController(text: contract?.licenseNumber ?? '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final reportManager = locator<ReportManager>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: secondaryColor.shade50,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Contrat et conducteur',
            style: TextStyle(
              fontFamily: kGlacialStyle,
              color: secondaryColor,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(
                10,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    8,
                  ),
                ),
                border: Border.all(
                  color: secondaryColor.shade50,
                ),
              ),
              child: Form(
                key: _formkey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    VehicleTypeWidget(
                      vehicleName: widget.vehicleDataEntity.vehicleName,
                      vehicleBgColor: widget.vehicleDataEntity.vehicleBgColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                      ),
                      child: TextFormField(
                        controller: _contractNumberController,
                        decoration: InputDecoration(
                          labelText: 'Numéro de contrat*',
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
                          hintText: "Numéro de contrat",
                        ),
                        validator: (value) {
                          if ((value == null || value.trim().isEmpty)) {
                            return "Ce champ est requis";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                      ),
                      child: TextFormField(
                        controller: _insuredNameController,
                        decoration: InputDecoration(
                          labelText: 'Nom de l\'assuré*',
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
                          hintText: "Nom de l'assuré",
                        ),
                        validator: (value) {
                          if ((value == null || value.trim().isEmpty)) {
                            return "Ce champ est requis";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                      ),
                      child: TextFormField(
                        controller: _insuredLastNameController,
                        decoration: InputDecoration(
                          labelText: 'Prénom de l\'assuré*',
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
                          hintText: "Prénom de l'assuré",
                        ),
                        validator: (value) {
                          if ((value == null || value.trim().isEmpty)) {
                            return "Ce champ est requis";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                      ),
                      child: TextFormField(
                        controller: _insuredAdresseController,
                        decoration: InputDecoration(
                          labelText: 'Adresse de l\'assuré*',
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
                          hintText: "Adresse de l'assuré ",
                        ),
                        validator: (value) {
                          if ((value == null || value.trim().isEmpty)) {
                            return "Ce champ est requis";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                      ),
                      child: TextFormField(
                        controller: _driverNameController,
                        decoration: InputDecoration(
                          labelText: 'Nom du conducteur*',
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
                          hintText: "Nom du conducteur ",
                        ),
                        validator: (value) {
                          if ((value == null || value.trim().isEmpty)) {
                            return "Ce champ est requis";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                      ),
                      child: TextFormField(
                        controller: _driverLastNameController,
                        decoration: InputDecoration(
                          labelText: 'Prénom du conducteur*',
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
                          hintText: "Prénom du conducteur ",
                        ),
                        validator: (value) {
                          if ((value == null || value.trim().isEmpty)) {
                            return "Ce champ est requis";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                      ),
                      child: TextFormField(
                        controller: _driverAdresseController,
                        decoration: InputDecoration(
                          labelText: 'Adresse du conducteur *',
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
                          hintText: "Adresse du conducteur ",
                        ),
                        validator: (value) {
                          if ((value == null || value.trim().isEmpty)) {
                            return "Ce champ est requis";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                      ),
                      child: TextFormField(
                        controller: _licenseNumberController,
                        decoration: InputDecoration(
                          labelText: 'Numéro de permis du conducteur *',
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
                          hintText: "Numéro de permis du conducteur ",
                        ),
                        validator: (value) {
                          if ((value == null || value.trim().isEmpty)) {
                            return "Ce champ est requis";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 16,
                      ),
                      child: Row(
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
                              if (_formkey.currentState != null &&
                                  _formkey.currentState!.validate()) {
                                final managerVehicles = reportManager.vehicles;
                                final vehicleToUpdateIndex =
                                    managerVehicles?.indexWhere(
                                  (element) =>
                                      element.docId ==
                                      widget.vehicleDataEntity.docId,
                                );
                                if (vehicleToUpdateIndex != null &&
                                    vehicleToUpdateIndex != -1) {
                                  managerVehicles
                                    ?..removeAt(vehicleToUpdateIndex)
                                    ..insert(
                                      vehicleToUpdateIndex,
                                      widget.vehicleDataEntity.copyWith(
                                        contract: VehicleContractEntity(
                                          contractNumber:
                                              _contractNumberController.text,
                                          insuredFirstName:
                                              _insuredNameController.text,
                                          insuredLastName:
                                              _insuredLastNameController.text,
                                          driverFirstName:
                                              _driverNameController.text,
                                          driverLastName:
                                              _driverLastNameController.text,
                                          licenseNumber:
                                              _licenseNumberController.text,
                                          insuredAddress:
                                              _insuredAdresseController.text,
                                          driverAddress:
                                              _driverAdresseController.text,
                                        ),
                                      ),
                                    );
                                  reportManager.vehicles = managerVehicles;
                                }
                                Navigator.of(context)
                                    .pop(reportManager.vehicles);
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
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
