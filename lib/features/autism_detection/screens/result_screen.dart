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
        return Colors.yellow;
      } else {
        return Colors.red;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Result Screen'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
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
                              ? "Your child has selected $yes 'Yes' out of $total, which might not indicate a higher likelihood. Continue monitoring your child's behavior and consult a healthcare professional if you have concerns."
                              : (yes > 4 && yes <= 9)
                                  ? "Your child has selected $yes 'Yes' out of $total, indicating a moderate likelihood. We recommend consulting a healthcare professional for further evaluation."
                                  : "Your child has selected $yes 'Yes' out of $total, indicating a higher likelihood. We recommend consulting a healthcare professional for further evaluation.",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // Add functionality for 'Join our Parents Community' button
                        },
                        icon: Icon(Icons.group),
                        label: Text('Join our Parents Community'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.deepPurple,
                          textStyle: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // Add functionality for 'Chat with Doctors' button
                        },
                        icon: Icon(Icons.chat),
                        label: Text('Chat with Doctors'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          textStyle: TextStyle(fontSize: 16),
                        ),
                      ),
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
