import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/questions.dart';
import 'package:flutter_application_1/questions_summary/question_summery.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.choosenAnswers,required this.onRestart});
  final List<String> choosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getSummeryData() {
    final List<Map<String, Object>> summery = [];
    for (int i = 0; i < choosenAnswers.length; i++) {
      summery.add({
        'question_index': i,
        'question' : questions[i].text,
        'correct_questions': questions[i].answers[0],

        'user_answer': choosenAnswers[i]
      });
    }
    return summery;
  }

  @override
  Widget build(BuildContext context) {

    final summaryData=getSummeryData();
    final numTotalQuestions=questions.length;
    final numCorrectQuestion=summaryData.where((data) {
      return data['correct_questions']==data['user_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text('You have answered $numCorrectQuestion out of $numTotalQuestions question correctly!',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 230, 200, 253),
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
             ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummery(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon
            (onPressed: onRestart,
            style: TextButton.styleFrom(
              foregroundColor: Colors.white
            ),
            icon: const Icon(Icons.refresh),
            label: const Text('Restart quiz'))
          ],
        ),
      ),
    );
  }
}
