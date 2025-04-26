import 'package:constatn/menu/report/domain/entities/witness_entity.dart';
import 'package:constatn/menu/report/utils/enums/input_mode_type.dart';
import 'package:constatn/menu/report/utils/enums/vehicle_type.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ReportManager {
  InputModeType? inputModeType;
  VehicleType? vehicleType;

  List<WitnessEntity>? witnesses;

  void clear() {
    inputModeType = null;
    vehicleType = null;
    witnesses = null;
  }
}
