import 'package:babynama_assignment/features/track_vaccination/models/vaccination_card.dart';
import 'package:babynama_assignment/features/track_vaccination/widgets/vaccine_card.dart';
import 'package:flutter/material.dart';

class UpcomingVaccineScreen extends StatefulWidget {
  final List<VaccinationCardModel> vaccineList;

  const UpcomingVaccineScreen({Key? key, required this.vaccineList})
      : super(key: key);

  @override
  State<UpcomingVaccineScreen> createState() => _UpcomingVaccineScreenState();
}

class _UpcomingVaccineScreenState extends State<UpcomingVaccineScreen> {
  @override
  Widget build(BuildContext context) {
    // Filter the upcoming vaccines
    List<VaccinationCardModel> upcomingVaccines = widget.vaccineList
        .where((vaccine) => vaccine.status == VaccinationStatus.upcoming)
        .toList();

    return ListView.builder(
      itemCount: upcomingVaccines.length,
      itemBuilder: (context, index) {
        return VaccinationCard(
          cardModel: upcomingVaccines[index],
        );
      },
    );
  }
}
