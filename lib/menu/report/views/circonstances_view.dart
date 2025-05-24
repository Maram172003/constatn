import 'package:constatn/menu/report/views/date_hour_view.dart';
import 'package:flutter/material.dart';
import '../../../shared/constants/app_constants.dart';
import '../../../shared/values/app_colors.dart';

class CirconstancesView extends StatefulWidget {
  const CirconstancesView({super.key});

  @override
  State<CirconstancesView> createState() => _CirconstancesViewState();
}

class _CirconstancesViewState extends State<CirconstancesView> {
  List<bool> leftChecked = List.filled(17, false);

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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Circonstances de l\'accident',
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
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: secondaryColor.shade200),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(labels.length, (index) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: leftChecked[index],
                        onChanged: (val) {
                          setState(() {
                            leftChecked[index] = val!;
                          });
                        },
                      ),
                      Expanded(
                        child: Text(
                          labels[index],
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: OutlinedButton.styleFrom(
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

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DateHourView()),
                    );

                  // Action de validation
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
      ),
    );
  }
}
