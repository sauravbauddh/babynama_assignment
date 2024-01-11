import 'package:babynama_assignment/features/autism_detection/data/question_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key, required this.chosenAnswers}) : super(key: key);

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryAns() {
    List<Map<String, Object>> summary = [];

    for (int i = 0; i < chosenAnswers.length; ++i) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'yes': questions[i].options[0],
        'user_ans': chosenAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryList = getSummaryAns();
    final total = questions.length;
    final yes = summaryList
        .where(
          (element) => element['user_ans'] == element['yes'],
        )
        .length;

    Color _getColorForYesResponses(int yes, int total) {
      if (yes <= 4) {
        return Colors.green;
      } else if (yes > 4 && yes <= 9) {
        return Colors.yellow.shade800;
      } else {
        return Colors.red;
      }
    }

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: double.infinity,
                child: Card(
                  elevation: 4,
                  margin: const EdgeInsets.all(20),
                  color: _getColorForYesResponses(yes, total),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Icon(
                          yes <= 4
                              ? Icons.sentiment_satisfied
                              : (yes > 4 && yes <= 9)
                                  ? Icons.sentiment_neutral
                                  : Icons.sentiment_dissatisfied,
                          size: 80,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          yes <= 4
                              ? "Your have selected $yes 'Yes' out of $total, which might not indicate a higher likelihood. Continue monitoring your child's behavior and consult a healthcare professional if you have concerns."
                              : (yes > 4 && yes <= 9)
                                  ? "Your have selected $yes 'Yes' out of $total, indicating a moderate likelihood. We recommend consulting a healthcare professional for further evaluation."
                                  : "Your have selected $yes 'Yes' out of $total, indicating a higher likelihood. We recommend consulting a healthcare professional for further evaluation.",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.openSans(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.group),
                        const SizedBox(width: 10),
                        Text(
                          "Join our parents community",
                          style: GoogleFonts.openSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.chat),
                        const SizedBox(width: 10),
                        Text(
                          "Chat with us",
                          style: GoogleFonts.openSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
