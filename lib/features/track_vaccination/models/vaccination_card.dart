enum VaccinationStatus { completed, upcoming, overdue }

class VaccinationCardModel {
  final String name;
  final DateTime dueDate;
  final VaccinationStatus status;

  VaccinationCardModel({
    required this.name,
    required this.dueDate,
    required this.status,
  });
}
