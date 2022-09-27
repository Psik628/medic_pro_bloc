import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/getwidget.dart';
import 'package:medic_pro_bloc/domain/subject/question.dart';
import 'package:medic_pro_bloc/presentation/pages/question_section/widgets/option_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../../application/question_section/question_section_bloc.dart';
import '../../../../domain/subject/option.dart';
import '../../../../logging.dart';

class QuestionWidget extends StatelessWidget {
  final log = logger(QuestionWidget);

  final Question currentQuestion;

  QuestionWidget({Key? key, required this.currentQuestion}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    print(context.watch<QuestionSectionBloc>().state.answeredQuestions.length);

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
                          // child: Text(currentQuestion.content)
                          child: Text('otazka')
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
                    // todo fix this height
                    height: 30.h,
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
        BlocBuilder<QuestionSectionBloc, QuestionSectionState>(
          builder: (context, QuestionSectionState state) {
            log.i("Checking whether to show Answer button");
            // get info about current question
            print(state.questions[state.questionToDisplayIndex].selectedOptions.isNotEmpty);
            if(state.questions[state.questionToDisplayIndex].selectedOptions.isNotEmpty){
              print('SHOULD ADD BUTTON');
              // if current question has some selected options, display answer button
              return GFButton(
                  fullWidthButton: true,
                  onPressed: (){
                    context.read<QuestionSectionBloc>().add(QuestionSectionEvent.answerQuestion());
                  },
                  child: Text('Answer')
              );
            }else{
              return const Offstage();
            }
          })
      ],
    );
  }
}
