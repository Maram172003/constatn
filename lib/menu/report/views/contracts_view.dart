import 'package:flutter/material.dart';

import '../../../shared/constants/app_constants.dart';
import '../../../shared/values/app_colors.dart';
import 'accident_place_view.dart';

class ContractsView extends StatefulWidget {
  const ContractsView({super.key});

  @override
  State<ContractsView> createState() => _ContractsViewState();
}

class _ContractsViewState extends State<ContractsView> {
  final _formkey = GlobalKey<FormState>();
  final _contractNumberController = TextEditingController();
  final _insuredNameController = TextEditingController();
  final _insuredLastNameController = TextEditingController();
  final _insuredAdresseController = TextEditingController();
  final _driverNameController = TextEditingController();
  final _driverLastNameController = TextEditingController();
  final _driverAdresseController = TextEditingController();
  final _licenseNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Contrats et conducteurs',
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
              key: _formkey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
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
                if (_formkey.currentState!.validate()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AccidentPlaceView()),
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
