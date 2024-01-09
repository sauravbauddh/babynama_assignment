import 'package:babynama_assignment/constants/string_constants.dart';
import 'package:babynama_assignment/features/autism_detection/screens/quiz.dart';
import 'package:babynama_assignment/features/dashboard/widgets/feature_card.dart';
import 'package:babynama_assignment/features/dashboard/widgets/plan_card.dart';
import 'package:babynama_assignment/theme/pallete.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashBoardScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DashBoardScreenState();
  }

  static route() => MaterialPageRoute(builder: (context) => DashBoardScreen());
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  late final List<Map<String, dynamic>> featureCardParams;

  @override
  void initState() {
    super.initState();

    void trackVaccination() {}
    ;

    void autismDetection() {
      Navigator.push(
        context,
        Quiz.route(),
      );
    }

    ;

    featureCardParams = [
      {
        'iconData': Icons.calendar_today,
        'text': 'Track Vaccination',
        'cardColor': Colors.blue,
        'cardOnTap': trackVaccination,
      },
      {
        'iconData': Icons.extension,
        'text': 'Autism Detection',
        'cardColor': Colors.green,
        'cardOnTap': autismDetection,
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Profiles",
            icon: Icon(Icons.person),
          ),
          BottomNavigationBarItem(
            label: "Account",
            icon: Icon(Icons.security),
          ),
        ],
      ),
      drawer: const Drawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          StringConstants.appName,
          style: GoogleFonts.openSans(
            color: Pallete.blackColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Pallete.blackColor),
      ),
      body: Column(
        children: [
          PlanCard(
            onTap: () {},
            text: StringConstants.planText,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (_, index) => FeatureCard(
                iconData: featureCardParams[index % featureCardParams.length]
                    ['iconData'],
                text: featureCardParams[index % featureCardParams.length]
                    ['text'],
                cardColor: featureCardParams[index % featureCardParams.length]
                    ['cardColor'],
                cardOnTap: featureCardParams[index % featureCardParams.length]
                    ['cardOnTap'],
              ),
              itemCount: 2,
            ),
          ),
        ],
      ),
    );
  }
}
