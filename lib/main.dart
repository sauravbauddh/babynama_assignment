import 'package:babynama_assignment/features/dashboard/screen/dashboard.dart';
import 'package:babynama_assignment/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BabyNama',
      theme: AppTheme.theme,
      home: DashBoardScreen(),
    );
  }
}
