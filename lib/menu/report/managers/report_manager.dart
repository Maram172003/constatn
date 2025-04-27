import 'package:constatn/menu/report/domain/entities/witness_entity.dart';
import 'package:constatn/menu/report/utils/enums/input_mode_type.dart';
import 'package:constatn/menu/report/utils/enums/vehicle_type.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ReportManager {
  InputModeType? inputModeType;
  VehicleType? firstVehicleType;
  VehicleType? secondVehicleType;

  List<WitnessEntity>? witnesses;

  void clear() {
    inputModeType = null;
    firstVehicleType = null;
    secondVehicleType = null;
    witnesses = null;
  }

  void clearWitnesses() {
    witnesses = null;
  }
}
