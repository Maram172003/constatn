import 'dart:io';

import 'package:constatn/menu/report/domain/entities/vehicle_accident_place.dart';
import 'package:constatn/menu/report/domain/entities/vehicle_data_entity.dart';
import 'package:constatn/menu/report/managers/report_manager.dart';
import 'package:constatn/shared/dependency_injection/app_component.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../shared/constants/app_constants.dart';
import '../../../../shared/values/app_colors.dart';

class AddAccidentPlaceView extends StatefulWidget {
  const AddAccidentPlaceView({
    super.key,
    required this.vehicleDataEntity,
  });

  final VehicleDataEntity vehicleDataEntity;

  @override
  State<AddAccidentPlaceView> createState() => _AddAccidentPlaceViewState();
}

class _AddAccidentPlaceViewState extends State<AddAccidentPlaceView> {
  File? image;
  bool noShockPoint = false;
  bool addShockPhoto = false;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
    }
  }

  late TextEditingController description;

  @override
  void initState() {
    super.initState();
    final vehiclePlace = widget.vehicleDataEntity.vehicleAccidentPlace;
    if (vehiclePlace?.image != null) {
      image = File(vehiclePlace!.image!.path);
    }
    description = TextEditingController(
      text: vehiclePlace?.description ?? '',
    );
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
            'Point de choc initial',
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.all(12),
                    margin: EdgeInsets.only(
                      bottom: 16,
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
                              "Prendre une photo pour indiquer le point de choc initial",
                              style: TextStyle(
                                fontFamily: kGlacialStyle,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: secondaryColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: noShockPoint,
                        activeColor: primaryColor,
                        onChanged: (value) {
                          setState(() {
                            noShockPoint = value!;
                            if (value) addShockPhoto = false;
                          });
                        },
                      ),
                      const Text(
                        "Pas de point de choc",
                        style: TextStyle(
                          fontFamily: kGlacialStyle,
                          fontSize: 16,
                          color: secondaryColor,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                    ),
                    child: Row(
                      children: [
                        Checkbox(
                          value: addShockPhoto,
                          activeColor: primaryColor,
                          onChanged: (value) {
                            setState(() {
                              addShockPhoto = value!;
                              if (value) noShockPoint = false;
                            });
                          },
                        ),
                        const Text(
                          "Ajouter une photo pour le point de choc",
                          style: TextStyle(
                            fontFamily: kGlacialStyle,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: secondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (addShockPhoto)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () => _pickImage(
                            ImageSource.camera,
                          ),
                          icon: const Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          ),
                          label: Text(
                            "Caméra",
                            style: TextStyle(
                              fontFamily: kGlacialStyle,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 18,
                            ),
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () => _pickImage(
                            ImageSource.gallery,
                          ),
                          icon: const Icon(
                            Icons.photo_library,
                            color: Colors.white,
                          ),
                          label: Text(
                            "Gallery",
                            style: TextStyle(
                              fontFamily: kGlacialStyle,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 16,
                    ),
                    child: Text(
                      "Description des dégâts",
                      style: TextStyle(
                        fontFamily: kGlacialStyle,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: secondaryColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                    ),
                    child: TextField(
                      maxLines: 3,
                      controller: description,
                      decoration: InputDecoration(
                        hintText: "Commentaire (optionnel)",
                        hintStyle: TextStyle(
                          fontFamily: kGlacialStyle,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: secondaryColor,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            8,
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (image != null)
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 30,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(
                          image!,
                          height: 300,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
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
                          onPressed: (addShockPhoto != false &&
                                      image != null) ||
                                  noShockPoint != false
                              ? () {
                                  final managerVehicles =
                                      reportManager.vehicles;
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
                                          accidentPlace: VehicleAccidentPlace(
                                            description: description.text,
                                            image: image,
                                          ),
                                        ),
                                      );
                                    reportManager.vehicles = managerVehicles;
                                  }
                                  Navigator.of(context)
                                      .pop(reportManager.vehicles);
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
    );
  }
}
