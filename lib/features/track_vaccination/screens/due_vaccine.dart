import 'package:babynama_assignment/features/track_vaccination/models/vaccination_card.dart';
import 'package:babynama_assignment/features/track_vaccination/widgets/vaccine_card.dart';
import 'package:flutter/material.dart';

class DueVaccineScreen extends StatefulWidget {
  final List<VaccinationCardModel> vaccineList;

  const DueVaccineScreen({Key? key, required this.vaccineList})
      : super(key: key);

  @override
  State<DueVaccineScreen> createState() => _DueVaccineScreenState();
}

class _DueVaccineScreenState extends State<DueVaccineScreen> {
  @override
  Widget build(BuildContext context) {
    List<VaccinationCardModel> dueVaccines = widget.vaccineList
        .where((vaccine) => vaccine.status == VaccinationStatus.overdue)
        .toList();

    return ListView.builder(
      itemCount: dueVaccines.length,
      itemBuilder: (context, index) {
        return VaccinationCard(
          cardModel: dueVaccines[index],
        );
      },
    );
  }
}
