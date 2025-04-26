import 'package:constatn/menu/report/domain/entities/witness_entity.dart';
import 'package:constatn/menu/report/managers/report_manager.dart';
import 'package:constatn/menu/report/utils/enums/report_step.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'update_report_state.dart';

@injectable
class UpdateReportCubit extends Cubit<UpdateReportState> {
  UpdateReportCubit(
    this._reportManager,
  ) : super(const UpdateReportStateInitial());
  final ReportManager _reportManager;

  void updateReportStep({
    required ReportStep newStep,
  }) {
    emit(
      UpdateReportStepWithSuccess(
        newStep,
      ),
    );
    emit(
      const UpdateReportStateInitial(),
    );
  }

  void updateWitnesses({
    required WitnessEntity witnessEntity,
  }) {
    _reportManager.witnesses?.remove(witnessEntity);
    emit(
      UpdateWitnessesWithSuccess(
        _reportManager.witnesses ?? [],
      ),
    );
    emit(
      const UpdateReportStateInitial(),
    );
  }
}
