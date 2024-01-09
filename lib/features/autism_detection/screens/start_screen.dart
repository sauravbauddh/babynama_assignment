import 'package:babynama_assignment/theme/pallete.dart';
import 'package:flutter/material.dart';

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
              'assets/images/quiz-logo.png',
              width: 250,
              color: const Color.fromARGB(150, 255, 255, 255),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: const Text(
              "Child Autism Questionnaire",
            ),
          ),
          Container(
              margin: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: startQuiz,
                child: const Text(
                  "Start Quiz",
                  style: TextStyle(color: Pallete.blackColor),
                ),
              )),
        ],
      ),
    );
  }
}
