import 'package:constatn/menu/report/bloc/update_report_cubit/update_report_cubit.dart';
import 'package:constatn/menu/report/domain/entities/witness_entity.dart';
import 'package:constatn/menu/report/managers/report_manager.dart';
import 'package:constatn/menu/report/utils/enums/report_step.dart';
import 'package:constatn/shared/dependency_injection/app_component.dart';
import 'package:constatn/shared/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/constants/app_constants.dart';

class AddNewWitnessView extends StatefulWidget {
  const AddNewWitnessView({super.key});

  @override
  State<AddNewWitnessView> createState() => _AddNewWitnessViewState();
}

class _AddNewWitnessViewState extends State<AddNewWitnessView> {
  final _formkey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _addressController = TextEditingController();
  final _postalCodeController = TextEditingController();
  final _cityController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final updateReportCubit = context.read<UpdateReportCubit>();
    final reportManager = locator<ReportManager>();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(12),
                color: Colors.yellow[100],
                child: Row(
                  children: [
                    Icon(Icons.lightbulb_outline),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                          "Vous devez renseigner au moins l'un des deux champs : numéro de téléphone ou adresse e-mail"),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0).copyWith(
                  top: 16,
                ),
                child: TextFormField(
                  controller: _firstNameController,
                  decoration: InputDecoration(
                    labelText: "Nom*",
                    hintText: "Nom du témoin",
                    border: OutlineInputBorder(),
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
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  controller: _lastNameController,
                  decoration: InputDecoration(
                    labelText: "Prénom*",
                    hintText: "Prénom du témoin",
                    border: OutlineInputBorder(),
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
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    labelText: "Numéro de téléphone",
                    hintText: "Numéro de téléphone du témoin",
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if ((value == null || value.isEmpty) &&
                        (_emailController.text.isEmpty)) {
                      return "Entrez au moins un numéro ou une adresse e-mail";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: "Adresse e-mail",
                    hintText: "Adresse e-mail du témoin",
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if ((value == null || value.isEmpty) &&
                        (_phoneController.text.isEmpty)) {
                      return "Entrez au moins un numéro ou une adresse e-mail";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  controller: _addressController,
                  decoration: InputDecoration(
                    labelText: "Adresse",
                    hintText: "Adresse du témoin",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  controller: _postalCodeController,
                  decoration: InputDecoration(
                    labelText: "Code postal",
                    hintText: "Code postal du témoin",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0).copyWith(
                  bottom: 20,
                ),
                child: TextFormField(
                  controller: _cityController,
                  decoration: InputDecoration(
                    labelText: "Ville",
                    hintText: "Ville du témoin",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .01,
                  bottom: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        updateReportCubit.updateReportStep(
                            newStep: ReportStep.addWitnesses);
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
                        if (_formkey.currentState!.validate()) {
                          final witnesses = reportManager.witnesses ?? [];
                          witnesses.add(
                            WitnessEntity(
                              firstName: _firstNameController.text,
                              lastName: _lastNameController.text,
                              phoneNumber: _phoneController.text,
                              emailAddress: _emailController.text,
                              address: _addressController.text,
                              postalCode: _postalCodeController.text,
                              city: _cityController.text,
                            ),
                          );
                          reportManager.witnesses = witnesses;
                          updateReportCubit.updateReportStep(
                              newStep: ReportStep.selectVehicleType);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
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
    );
  }
}
