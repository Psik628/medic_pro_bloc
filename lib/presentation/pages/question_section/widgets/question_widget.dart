import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:medic_pro_bloc/domain/subject/question.dart';
import 'package:medic_pro_bloc/presentation/pages/question_section/widgets/option_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../../domain/subject/option.dart';

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
                      padding: const EdgeInsets.all(20),
                      child: Center(
                          child: Text(currentQuestion.content)
                      )
                  )
                ),
              ),
            )
          ],
        ),
        StreamBuilder(
          stream: currentQuestion.options,
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const GFLoader();
            }else if (snapshot.connectionState == ConnectionState.active || snapshot.connectionState == ConnectionState.done){

              return Column(
                children: [
                  SizedBox(
                    height: 50.h,
                    child: ListView.builder(
                        itemCount: snapshot.data.length,
                        shrinkWrap: true,
                        itemBuilder: (context, optionIndex){
                          final Option currentOption = snapshot.data[optionIndex];
                          return OptionWidget(currentOption: currentOption);
                        }
                    ),
                  ),
                ],
              );
            }
            return const GFLoader();
          }
        ),
      ],
    );
  }
}
