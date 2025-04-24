import 'package:constatn/menu/report/utils/enums/input_mode_type.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ReportManager {
  InputModeType? inputModeType;

  void clear() {
    inputModeType = null;
  }
}
