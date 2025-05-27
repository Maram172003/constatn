import 'dart:typed_data';

import 'package:constatn/menu/report/managers/report_manager.dart';
import 'package:constatn/menu/report/utils/enums/input_mode_type.dart';
import 'package:constatn/menu/report/widgets/vehicle_type_widget.dart';
import 'package:constatn/menu/report_success_view.dart';
import 'package:constatn/shared/dependency_injection/app_component.dart';
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

import '../../../shared/constants/app_constants.dart';
import '../../../shared/values/app_colors.dart';

class SignatureView extends StatefulWidget {
  const SignatureView({super.key});

  @override
  State<SignatureView> createState() => _SignatureViewState();
}

class _SignatureViewState extends State<SignatureView> {
  Uint8List? exportedImage;
  late ReportManager reportManager;
  bool isSelectingSecondVehicle = false;
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white38,
  );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    reportManager = locator<ReportManager>();
  }

  void _addVehicleSignImage(String docId, Uint8List? signImage) {
    final vehicles = reportManager.vehicles ?? [];
    final vehicleIndex =
        vehicles.indexWhere((element) => element.docId == docId);
    if (vehicleIndex != -1) {
      vehicles[vehicleIndex] = vehicles[vehicleIndex].copyWith(
        signImage: signImage,
      );
    }
    reportManager.vehicles = vehicles;
  }

  @override
  Widget build(BuildContext context) {
    final vehicles = reportManager.vehicles ?? [];
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: VehicleTypeWidget(
                    vehicleName:
                        isSelectingSecondVehicle ? 'Véhicule B' : 'Véhicule A',
                    vehicleBgColor:
                        isSelectingSecondVehicle ? Colors.amber : primaryColor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 16,
                  ),
                  child: Text(
                    'Veuillez ajouter votre signature ',
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
                  height: MediaQuery.of(context).size.height * .6,
                  width: MediaQuery.of(context).size.width,
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
                  child: Signature(
                    controller: _controller,
                    height: 258,
                    width: MediaQuery.of(context).size.width / 1.85,
                    backgroundColor: Colors.lightBlue[100]!,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _controller.clear();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      disabledBackgroundColor: secondaryColor.shade200,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 18,
                      ),
                    ),
                    child: Text(
                      "Réinitialiser",
                      style: TextStyle(
                        fontFamily: kGlacialStyle,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final signImage = await _controller.toPngBytes();
                      if (!isSelectingSecondVehicle &&
                          reportManager.inputModeType ==
                              InputModeType.twoDriversOneSmartphone &&
                          vehicles.length == 2) {
                        _addVehicleSignImage(
                          vehicles[0].docId,
                          signImage,
                        );
                        setState(() {
                          isSelectingSecondVehicle = true;
                          _controller.clear();
                        });
                      } else {
                        final docId =
                            (vehicles.length == 2 && isSelectingSecondVehicle)
                                ? vehicles[1].docId
                                : vehicles[0].docId;

                        _addVehicleSignImage(docId, signImage);
                        if (context.mounted) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ReportSuccessView(),
                            ),
                          );
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      disabledBackgroundColor: secondaryColor.shade200,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
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
    );
  }
}
