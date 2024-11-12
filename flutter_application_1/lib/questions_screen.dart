import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application_1/answer_buttan.dart';
import 'package:flutter_application_1/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.onSelectAnswer,{super.key});
  final void Function (String anser) onSelectAnswer;

  @override
  State<StatefulWidget> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentQuestionIndex =0;
  void answerQuestion(String selectedAnswer){
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(color: Colors.white,fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            
            const SizedBox(height: 30),
            /* AnswerButtan(answerText: currentQuestion.answers[0], onTap: (){}),
            AnswerButtan(answerText: currentQuestion.answers[1], onTap: (){}),
            AnswerButtan(answerText: currentQuestion.answers[2], onTap: (){}),
            AnswerButtan(answerText: currentQuestion.answers[3], onTap: (){})*/
            //spreading
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButtan(answerText: answer, onTap: ()=>{
                answerQuestion(answer)
              });
            })
          ],
        ),
      ),
    );
  }
}
