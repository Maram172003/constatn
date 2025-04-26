enum ReportStep {
  addWitnesses(step: 1, headerTitle: "Ajout des témoins"),
  addNewWitness(step: 1.5, headerTitle: "Ajout un témoin"),
  selectVehicleType(step: 2, headerTitle: "Type de véhicule"),
  contracts(step: 3, headerTitle: "Contrats et conducteurs"),
  accidentPlace(step: 3.5, headerTitle: "Point de choc initital"),
  circumstances(step: 4, headerTitle: "Circonstances"),
  dateHourAccident(step: 4.5, headerTitle: "Date,heure et lieu"),
  sketch(step: 5, headerTitle: "Dessiner le croquis"),
  observations(step: 6, headerTitle: "Observations"),
  sign(step: 7, headerTitle: "Signature");

  final double step;
  final String headerTitle;

  const ReportStep({
    required this.step,
    required this.headerTitle,
  });
}
