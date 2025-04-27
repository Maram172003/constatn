import 'package:constatn/menu/report/domain/entities/vehicle_data_entity.dart';
import 'package:constatn/menu/report/domain/entities/witness_entity.dart';
import 'package:constatn/menu/report/utils/enums/input_mode_type.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ReportManager {
  InputModeType? inputModeType;

  List<VehicleDataEntity>? vehicles;

  List<WitnessEntity>? witnesses;

  void clear() {
    inputModeType = null;
    witnesses = null;
    vehicles = null;
  }

  void clearWitnesses() {
    witnesses = null;
  }

  void clearVehicles() {
    vehicles = null;
  }
}
