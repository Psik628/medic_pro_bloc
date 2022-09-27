import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/components/button/gf_button_bar.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/getwidget.dart';
import 'package:medic_pro_bloc/application/question_section/question_section_bloc.dart';
import 'package:sizer/sizer.dart';

class ResultsPageWidget extends StatelessWidget {
  const ResultsPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionSectionBloc, QuestionSectionState>(
      builder: (context, state) {
        return Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                BlocBuilder<QuestionSectionBloc, QuestionSectionState>(
                  builder: (context, state) {

                    return ListView.builder(
                      itemCount: state.questions.length,
                      shrinkWrap: true,
                      // this makes this SingleChildScrollView scrollable
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, questionIndex) {
                        return
                          GFCard(
                            color: GFColors.DANGER,
                            boxFit: BoxFit.cover,
                            content: Text(
                              // todo solve null
                              state.questions[questionIndex].content!
                            ),
                            buttonBar: GFButtonBar(
                              direction: Axis.vertical,
                              children: <Widget>[
                                SizedBox(
                                  height: 100,
                                  child: StreamBuilder(
                                    stream: state.questions[questionIndex].options,
                                    builder: (BuildContext context, AsyncSnapshot snapshot) {

                                    if (snapshot.connectionState == ConnectionState.waiting) {
                                      return const GFLoader(type: GFLoaderType.square,);
                                    }else if (snapshot.connectionState == ConnectionState.active || snapshot.connectionState == ConnectionState.done) {
                                      return Expanded(
                                        child: ListView.builder(
                                            itemCount: snapshot.data.length,
                                            shrinkWrap: true,
                                            itemBuilder: (context, optionIndex) {
                                              return SizedBox(
                                                height: 100,
                                                child: GFButton(
                                                  onPressed: () {},
                                                  text: snapshot.data.options[optionIndex].content,
                                                ),
                                              );
                                            }
                                        ),
                                      );
                                    } else{
                                      return const GFLoader(type: GFLoaderType.ios,);
                                    }
                                  }
                              ),
                                )
                            ],
                          ),
                        );
                      }
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
