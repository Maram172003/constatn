part of 'update_report_cubit.dart';

sealed class UpdateReportState extends Equatable {
  const UpdateReportState();

  @override
  List<Object> get props => [];
}

final class UpdateReportStateInitial extends UpdateReportState {
  const UpdateReportStateInitial();
}

final class UpdateReportStepWithSuccess extends UpdateReportState {
  const UpdateReportStepWithSuccess(this.reportStep);

  final ReportStep reportStep;
}

final class UpdateWitnessesWithSuccess extends UpdateReportState {
  const UpdateWitnessesWithSuccess(this.witnesses);

  final List<WitnessEntity> witnesses;
}
