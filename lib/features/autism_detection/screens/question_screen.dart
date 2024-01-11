import 'package:babynama_assignment/features/autism_detection/data/question_data.dart';
import 'package:babynama_assignment/features/autism_detection/widgets/answer_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.chooseAnswer});

  final void Function(String answer) chooseAnswer;

  @override
  State<StatefulWidget> createState() {
    return _QuestionState();
  }
}

class _QuestionState extends State<QuestionScreen> {
  var currIndex = 0;

  void answerQuestion(String answer) {
    widget.chooseAnswer(answer);
    setState(() {
      currIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var currQuestion = questions[currIndex];
    return Container(
      margin: const EdgeInsets.all(40),
      child: SizedBox(
        width: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 40.0),
                child: Text(
                  currQuestion.question,
                  style: GoogleFonts.openSans(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              ...currQuestion.options.map((answers) {
                return AnswerButton(
                    answer: answers,
                    onTap: () {
                      answerQuestion(answers);
                    });
              })
            ]),
      ),
    );
  }
}
