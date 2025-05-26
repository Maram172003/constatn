import 'package:constatn/menu/report/bloc/update_report_cubit/update_report_cubit.dart';
import 'package:constatn/menu/report/utils/enums/report_step.dart';
import 'package:constatn/shared/constants/app_constants.dart';
import 'package:constatn/shared/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DateHourView extends StatefulWidget {
  const DateHourView({super.key});

  @override
  State<DateHourView> createState() => _DateHourViewState();
}

class _DateHourViewState extends State<DateHourView> {
  final _formkey = GlobalKey<FormState>();
  final _dateController = TextEditingController();
  final _hourController = TextEditingController();
  final _lieuController = TextEditingController();
  final _postalCodeController = TextEditingController();
  final _villeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final updateReportCubit = context.read<UpdateReportCubit>();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              top: 16,
            ),
            child: Text(
              'Veuillez renseigner la date, l\'heure et le lieu de l\'accident :',
              style: TextStyle(
                fontFamily: kGlacialStyle,
                color: secondaryColor,
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
          ),
          Container(
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
                      controller: _dateController,
                      decoration: InputDecoration(
                        labelText: 'Date*',
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
                        hintText: "20/04/2025",
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
                      controller: _hourController,
                      decoration: InputDecoration(
                        labelText: 'Heure*',
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
                        hintText: "22:14",
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
                      controller: _lieuController,
                      decoration: InputDecoration(
                        labelText: 'Lieu(adresse,route,etc.)*',
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
                        hintText: "13 Avenue Paul Doumer",
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
                      controller: _postalCodeController,
                      decoration: InputDecoration(
                        labelText: 'Code postal*',
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
                        hintText: "93360",
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
                      controller: _villeController,
                      decoration: InputDecoration(
                        labelText: 'Ville*',
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
                        hintText: "Neuilly-Plaisance ",
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
          Padding(
            padding: const EdgeInsets.all(
              16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    updateReportCubit.updateReportStep(
                      newStep: ReportStep.circumstancesRecap,
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
                      if (_formkey.currentState!.validate()) {
                        updateReportCubit.updateReportStep(
                          newStep: ReportStep.sketch,
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
