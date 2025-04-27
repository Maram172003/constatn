import 'package:constatn/menu/report/utils/enums/vehicle_type.dart';
import 'package:flutter/cupertino.dart';

class VehicleDataEntity {
  VehicleDataEntity({
    required this.docId,
    required this.vehicleType,
    required this.vehicleName,
    required this.vehicleBgColor,
    this.carRegistrationNumber,
    this.insuranceName,
  });

  final String docId;
  final String vehicleName;
  final VehicleType vehicleType;

  final String? carRegistrationNumber;
  final String? insuranceName;
  final Color vehicleBgColor;

  VehicleDataEntity copyWith({
    String? registrationNumber,
    String? insurance,
  }) {
    return VehicleDataEntity(
      vehicleBgColor: vehicleBgColor,
      docId: docId,
      vehicleName: vehicleName,
      vehicleType: vehicleType,
      carRegistrationNumber: registrationNumber ?? carRegistrationNumber,
      insuranceName: insurance ?? insuranceName,
    );
  }
}
