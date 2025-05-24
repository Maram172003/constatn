import 'package:constatn/menu/report/views/croquis_view.dart';
import 'package:flutter/material.dart';

import '../../../shared/constants/app_constants.dart';
import '../../../shared/values/app_colors.dart';

class DateHourView extends StatefulWidget {
  const DateHourView({super.key});

  @override
  State<DateHourView> createState() => _DateHourViewState();
}

class _DateHourViewState extends State<DateHourView> {
  final _formkey = GlobalKey<FormState>();
  final _dateController = TextEditingController();
  final _heureController = TextEditingController();
  final _lieuController = TextEditingController();
  final _codepostalController = TextEditingController();
  final _villeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Date,heure et lieu',
            style: TextStyle(
              fontFamily: kGlacialStyle,
              color: secondaryColor,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 16),
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
                          controller: _heureController,
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
                          controller: _codepostalController,
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
            ],
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
                    MaterialPageRoute(builder: (context) => CroquisView()),
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
