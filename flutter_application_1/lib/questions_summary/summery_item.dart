import 'package:flutter/material.dart';
import 'package:flutter_application_1/questions_summary/question_identifire.dart';
import 'package:google_fonts/google_fonts.dart';

class SummeryItem extends StatelessWidget {
  const SummeryItem(this.itemData,{super.key});
  final Map<String,Object> itemData; 

  @override
  Widget build(BuildContext context) {
   final isCorrectAnswer=itemData['user_answer'] == itemData['correct_questions'];
   return Padding(
    padding: const EdgeInsets.symmetric(vertical: 0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifire(isCorrectAnswer: isCorrectAnswer, questionIndex: itemData['question_index'] as int),
        const SizedBox(width: 20),
        Expanded(child: Column(
          children: [
            Text(
              itemData['question'] as String,
              style: GoogleFonts.lato(color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              )
            ),
            const SizedBox(height: 5),
            Text(
              itemData['user_answer'] as String,
              style: const TextStyle(
                color: Color.fromARGB(255, 202, 171, 252),
              ),
            ),
             Text(
              itemData['correct_questions'] as String,
              style: const TextStyle(
                color: Color.fromARGB(255, 181, 254, 246),
              ),
            )
            
          ],
        ))
      ],
    ),
    );
  }
}