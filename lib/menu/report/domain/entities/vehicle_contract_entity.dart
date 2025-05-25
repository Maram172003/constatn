class VehicleContractEntity {
  VehicleContractEntity({
    required this.contractNumber,
    required this.insuredFirstName,
    required this.insuredLastName,
    required this.driverFirstName,
    required this.driverLastName,
    required this.licenseNumber,
    required this.insuredAddress,
    required this.driverAddress,
  });

  final String contractNumber;
  final String insuredFirstName;
  final String insuredLastName;
  final String insuredAddress;
  final String driverFirstName;
  final String driverLastName;
  final String driverAddress;
  final String licenseNumber;
}
