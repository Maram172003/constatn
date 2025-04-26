import 'package:flutter/material.dart';

import '../../../shared/constants/app_constants.dart';
import '../../../shared/dependency_injection/app_component.dart';
import '../../../shared/values/app_colors.dart';
import '../managers/report_manager.dart';
import '../utils/enums/input_mode_type.dart';
import '../widgets/input_mode_widget.dart';
import 'adding_witnesses_view.dart';


class VehicaleTypeView extends StatefulWidget {
  const VehicaleTypeView({super.key});

  @override
  State<VehicaleTypeView> createState() => _VehicaleTypeViewState();
}

class _VehicaleTypeViewState extends State<VehicaleTypeView> {
  late ReportManager reportManager;
  InputModeType? selectedInputMode;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    reportManager = locator<ReportManager>();
    selectedInputMode = reportManager.inputModeType;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (_, __) {
        reportManager.clear();
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: secondaryColor,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            title: Text(
              'Étape 2/7',
              style: TextStyle(
                fontFamily: kGlacialStyle,
                color: secondaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 25,
              ),
            ),
            centerTitle: true,
          ),

          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
            ).copyWith(
              top: 20,
            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Type de véhicule",
                  style: TextStyle(
                    fontFamily: kGlacialStyle,
                    color: secondaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 25,

                  ),
                ),
                SizedBox(height: 25),
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: Color(0xFF5A6EBD), // Yellow color
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.directions_car,
                          color: Colors.black,
                          size: 25,
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    const Text(
                      'Véhicule A',
                      style: TextStyle(
                        fontFamily: kGlacialStyle,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InputModeWidget(
                      inputModeIllustration:
                      'assets/images/two_drivers_one_smartphone.jpg',
                      isEnabled: selectedInputMode ==
                          InputModeType.car,
                      description: 'Voiture\n',
                      onChecked: (bool value) {
                        setState(() {
                          selectedInputMode = value
                              ? InputModeType.car
                              : null;
                        });
                      },
                    ),
                    InputModeWidget(
                      inputModeIllustration:
                      'assets/images/one_driver_one_smartphone.jpg',
                      isEnabled: selectedInputMode ==
                          InputModeType.truck,
                      description: 'Camion\ncamionnette',
                      onChecked: (bool value) {
                        setState(() {
                          selectedInputMode = value
                              ? InputModeType.truck
                              : null;
                        });
                      },
                    ),

                  ],
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InputModeWidget(
                      inputModeIllustration:
                      'assets/images/two_drivers_one_smartphone.jpg',
                      isEnabled: selectedInputMode ==
                          InputModeType.motorcycle,
                      description: 'Deux-roues\nmotorisés',
                      onChecked: (bool value) {
                        setState(() {
                          selectedInputMode = value
                              ? InputModeType.motorcycle
                              : null;
                        });
                      },
                    ),
                    InputModeWidget(
                      inputModeIllustration:
                      'assets/images/one_driver_one_smartphone.jpg',
                      isEnabled: selectedInputMode ==
                          InputModeType.bicycle,
                      description: 'Vélo\nVélo électrique',
                      onChecked: (bool value) {
                        setState(() {
                          selectedInputMode = value
                              ? InputModeType.bicycle
                              : null;
                        });
                      },
                    ),

                  ],
                ),

              ],
            ),
          ),
          floatingActionButton: ElevatedButton(
            onPressed: selectedInputMode != null
                ? () {
              reportManager.inputModeType = selectedInputMode;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddingWitnessesView(),
                ),
              );
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
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        ),
      ),
    );
  }
}
