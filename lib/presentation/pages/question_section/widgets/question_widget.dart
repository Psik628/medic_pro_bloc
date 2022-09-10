import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medic_pro_bloc/domain/subject/question.dart';
import 'package:sizer/sizer.dart';

class QuestionWidget extends StatelessWidget {

  final Question currentQuestion;

  const QuestionWidget({Key? key, required this.currentQuestion}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                height: 30.h,
                color: Colors.grey,
                child: Card(
                  child: Padding(
                      // todo extract this
                      padding: EdgeInsets.all(20),
                      child: Center(
                          child: Text(currentQuestion.content)
                      )
                  )
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
