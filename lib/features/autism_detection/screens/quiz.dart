import 'package:babynama_assignment/features/autism_detection/data/question_data.dart';
import 'package:babynama_assignment/features/autism_detection/screens/question_screen.dart';
import 'package:babynama_assignment/features/autism_detection/screens/result_screen.dart';
import 'package:babynama_assignment/features/autism_detection/screens/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }

  static route() => MaterialPageRoute(builder: (context) => const Quiz());
}

class _QuizState extends State<Quiz> {
  var activeState = "start-screen";

  List<String> answers = [];

  @override
  void initState() {
    super.initState();
  }

  void chooseAnswer(String answer) {
    answers.add(answer);

    if (answers.length == questions.length) {
      setState(() {
        activeState = "result-screen";
      });
    }
  }

  switchScreen() {
    setState(() {
      answers = [];
      activeState = "question-screen";
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeState == "question-screen") {
      screenWidget = QuestionScreen(chooseAnswer: chooseAnswer);
    }

    if (activeState == "result-screen") {
      screenWidget = ResultScreen(chosenAnswers: answers);
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Autism Detection Quiz"),
      ),
      body: Container(
        child: screenWidget,
      ),
    );
  }
}
