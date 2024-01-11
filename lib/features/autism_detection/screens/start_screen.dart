import 'package:babynama_assignment/theme/pallete.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: Image.asset(
              'assets/images/autism.png',
              width: 250,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: Text(
              style: GoogleFonts.openSans(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Palette.whiteColor,
              ),
              "Child Autism Questionnaire",
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: OutlinedButton(
              onPressed: startQuiz,
              child: Text(
                "Start Quiz",
                style: GoogleFonts.openSans(
                  fontSize: 16,
                  color: Palette.whiteColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
