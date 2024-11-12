import 'package:flutter/material.dart';
import 'package:flutter_application_1/questions_summary/summery_item.dart';

class QuestionSummery extends StatelessWidget{
  const QuestionSummery(this.summaryData,{super.key});
  final List<Map<String,Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
        children: 
          summaryData.map((data){
            return SummeryItem(data);
          }).toList(),
      ),
      )
    );
  }
}