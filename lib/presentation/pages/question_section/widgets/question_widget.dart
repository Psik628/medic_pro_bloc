import 'package:flutter/cupertino.dart';
import 'package:medic_pro_bloc/domain/subject/question.dart';

class QuestionWidget extends StatelessWidget {

  final Question currentQuestion;

  const QuestionWidget({Key? key, required this.currentQuestion}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(currentQuestion.title);
  }
}
