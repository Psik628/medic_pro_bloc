import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/components/button/gf_button_bar.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:medic_pro_bloc/application/question_section/question_section_bloc.dart';

class ResultsPageCardWidget extends StatelessWidget {
  const ResultsPageCardWidget({Key? key, required this.questionIndex}) : super(key: key);

  final int questionIndex;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionSectionBloc, QuestionSectionState>(
      builder: (context, state) {
        return GFCard(
          color: state.questions[questionIndex].answeredCorrectly() ? GFColors.SUCCESS : GFColors.DANGER,
          content: Text(state.questions[questionIndex].content!),
          buttonBar: GFButtonBar(
            children: [
              StreamBuilder(
                  stream: state.questions[questionIndex].options,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const GFLoader(type: GFLoaderType.square);
                    }else if (snapshot.connectionState == ConnectionState.active || snapshot.connectionState == ConnectionState.done) {
                      return ListView.builder(
                          itemCount: snapshot.data.length,
                          shrinkWrap: true,
                          // making the options list view not scrollable
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, optionIndex) {
                            return GFButton(
                              onPressed: () {},
                              color: snapshot.data[optionIndex].correct ? GFColors.SUCCESS : GFColors.DANGER,
                              // checking if the current option is in QuestionSectionState selectedOptions field
                              shape: state.questions[questionIndex].selectedOptions.contains(snapshot.data[optionIndex]) ? GFButtonShape.pills : GFButtonShape.square,
                              text: snapshot.data[optionIndex].content,
                            );
                          }
                      );
                    } else{
                      return const GFLoader(type: GFLoaderType.ios);
                    }
                  }
              ),
            ],
          ),
        );
      },
    );
  }
}
