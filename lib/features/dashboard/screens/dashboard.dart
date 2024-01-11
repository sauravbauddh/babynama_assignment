import 'package:babynama_assignment/features/autism_detection/screens/quiz.dart';
import 'package:babynama_assignment/features/dashboard/widgets/feature_card.dart';
import 'package:babynama_assignment/features/dashboard/widgets/plan_card.dart';
import 'package:babynama_assignment/features/track_vaccination/screens/main_screen.dart';
import 'package:babynama_assignment/theme/pallete.dart';
import 'package:flutter/material.dart';

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

    void trackVaccination() {
      Navigator.push(
        context,
        MainScreen.route(),
      );
    }

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
        'cardColor': Palette.tealColor,
        'cardOnTap': trackVaccination,
      },
      {
        'iconData': Icons.extension,
        'text': 'Autism Detection',
        'cardColor': Palette.brownColor,
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
        title: const Text(
          "Babynama",
        ),
      ),
      body: Column(
        children: [
          PlanCard(
            onTap: () {},
            text:
                "Find the perfect care for your child: Explore Our Plans Now!",
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
