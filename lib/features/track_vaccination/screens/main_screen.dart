import 'package:babynama_assignment/features/track_vaccination/models/vaccination_card.dart';
import 'package:babynama_assignment/features/track_vaccination/screens/completed_vaccine.dart';
import 'package:babynama_assignment/features/track_vaccination/screens/due_vaccine.dart';
import 'package:babynama_assignment/features/track_vaccination/screens/upcoming_vaccine.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
  static route() => MaterialPageRoute(builder: (context) => const MainScreen());
}

class _MainScreenState extends State<MainScreen> {
  List<VaccinationCardModel> randomVaccinationList = [
    VaccinationCardModel(
      name: 'Hepatitis B',
      dueDate: DateTime.now().add(const Duration(days: 10)),
      status: VaccinationStatus.upcoming,
    ),
    VaccinationCardModel(
      name: 'Poliovirus',
      dueDate: DateTime.now().add(const Duration(days: 15)),
      status: VaccinationStatus.upcoming,
    ),
    VaccinationCardModel(
      name: 'Influenza',
      dueDate: DateTime.now().add(const Duration(days: 25)),
      status: VaccinationStatus.upcoming,
    ),
    VaccinationCardModel(
      name: 'Diphtheria and Tetanus',
      dueDate: DateTime.now().add(const Duration(days: 8)),
      status: VaccinationStatus.upcoming,
    ),
    VaccinationCardModel(
      name: 'Varicella (Chickenpox)',
      dueDate: DateTime.now().add(const Duration(days: 2)),
      status: VaccinationStatus.completed,
    ),
    VaccinationCardModel(
      name: 'Haemophilus influenzae type b',
      dueDate: DateTime.now().subtract(const Duration(days: 12)),
      status: VaccinationStatus.overdue,
    ),
    VaccinationCardModel(
      name: 'Pneumococcal Conjugate',
      dueDate: DateTime.now().add(const Duration(days: 18)),
      status: VaccinationStatus.completed,
    ),
    VaccinationCardModel(
      name: 'Hepatitis A',
      dueDate: DateTime.now().add(const Duration(days: 30)),
      status: VaccinationStatus.upcoming,
    ),
    VaccinationCardModel(
      name: 'Meningococcal',
      dueDate: DateTime.now().subtract(const Duration(days: 3)),
      status: VaccinationStatus.overdue,
    ),
    VaccinationCardModel(
      name: 'Rotavirus',
      dueDate: DateTime.now().add(const Duration(days: 5)),
      status: VaccinationStatus.upcoming,
    ),
    VaccinationCardModel(
      name: 'Tetanus',
      dueDate: DateTime.now().subtract(const Duration(days: 20)),
      status: VaccinationStatus.overdue,
    ),
    VaccinationCardModel(
      name: 'Human Papillomavirus',
      dueDate: DateTime.now().add(const Duration(days: 12)),
      status: VaccinationStatus.upcoming,
    ),
    VaccinationCardModel(
      name: 'Inactivated Poliovirus',
      dueDate: DateTime.now().subtract(const Duration(days: 10)),
      status: VaccinationStatus.overdue,
    ),
    VaccinationCardModel(
      name: 'Mumps',
      dueDate: DateTime.now().add(const Duration(days: 22)),
      status: VaccinationStatus.completed,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Track Vaccination",
          ),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "Upcoming",
              ),
              Tab(
                text: "Overdue",
              ),
              Tab(
                text: "Completed",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            UpcomingVaccineScreen(
              vaccineList: randomVaccinationList,
            ),
            DueVaccineScreen(
              vaccineList: randomVaccinationList,
            ),
            CompletedVaccineScreen(
              vaccineList: randomVaccinationList,
            ),
          ],
        ),
      ),
    );
  }
}
