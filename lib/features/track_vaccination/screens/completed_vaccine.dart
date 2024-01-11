import 'package:babynama_assignment/features/track_vaccination/models/vaccination_card.dart';
import 'package:babynama_assignment/features/track_vaccination/widgets/vaccine_card.dart';
import 'package:flutter/material.dart';

class CompletedVaccineScreen extends StatefulWidget {
  final List<VaccinationCardModel> vaccineList;

  const CompletedVaccineScreen({Key? key, required this.vaccineList})
      : super(key: key);

  @override
  State<CompletedVaccineScreen> createState() => _CompletedVaccineScreenState();
}

class _CompletedVaccineScreenState extends State<CompletedVaccineScreen> {
  @override
  Widget build(BuildContext context) {
    List<VaccinationCardModel> completedVaccines = widget.vaccineList
        .where((vaccine) => vaccine.status == VaccinationStatus.completed)
        .toList();

    return ListView.builder(
      itemCount: completedVaccines.length,
      itemBuilder: (context, index) {
        return VaccinationCard(
          cardModel: completedVaccines[index],
        );
      },
    );
  }
}
