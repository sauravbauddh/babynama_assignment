import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryUI extends StatelessWidget {
  const SummaryUI({super.key, required this.summaryList});

  final List<Map<String, Object>> summaryList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: summaryList.map(
            (data) {
              Color bgcolor = Colors.blue;
              for (int i = 0; i < data.length; ++i) {
                bgcolor = data['user_ans'] == data['yes']
                    ? Colors.blue
                    : Colors.purpleAccent;
              }
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    alignment: Alignment.topLeft,
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: bgcolor,
                      child: Center(
                        child: Text(
                          ((data['question_index'] as int) + 1).toString(),
                          style: const TextStyle(
                              color: Colors.black, fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.symmetric(
                              vertical: 2, horizontal: 5),
                          margin: const EdgeInsets.only(bottom: 5, top: 5),
                          child: Text(
                            data['question'] as String,
                            style: GoogleFonts.lato(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2, horizontal: 5),
                          alignment: Alignment.topLeft,
                          child: Text(
                            data['user_ans'] as String,
                            style: const TextStyle(),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2, horizontal: 5),
                          alignment: Alignment.topLeft,
                          child: Text(
                            data['yes'] as String,
                            style: const TextStyle(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
