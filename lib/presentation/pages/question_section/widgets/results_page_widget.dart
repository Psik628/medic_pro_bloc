import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/components/button/gf_button_bar.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:medic_pro_bloc/application/question_section/question_section_bloc.dart';

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
                GFCard(
                  color: GFColors.DANGER,
                  boxFit: BoxFit.cover,
                  content: Text("Some quick example text to build on the card"),
                  buttonBar: GFButtonBar(
                    direction: Axis.vertical,
                    children: <Widget>[
                      GFButton(
                        onPressed: () {},
                        text: 'Some Answer',
                      ),
                      GFButton(
                        onPressed: () {},
                        text: 'Cancel',
                      ),
                      GFButton(
                        onPressed: () {},
                        text: 'Buy',
                      ),
                      GFButton(
                        onPressed: () {},
                        text: 'Buy',
                      ),
                    ],
                  ),
                ),
                GFCard(
                  color: GFColors.SUCCESS,
                  boxFit: BoxFit.cover,
                  content: Text("Some quick example text to build on the card"),
                  buttonBar: GFButtonBar(
                    direction: Axis.vertical,
                    children: <Widget>[
                      GFButton(
                        onPressed: () {},
                        text: 'Some Answer',
                      ),
                      GFButton(
                        onPressed: () {},
                        text: 'Cancel',
                      ),
                      GFButton(
                        onPressed: () {},
                        text: 'Buy',
                      ),
                      GFButton(
                        onPressed: () {},
                        text: 'Buy',
                      ),
                    ],
                  ),
                ),
                GFCard(
                  color: GFColors.WARNING,
                  boxFit: BoxFit.cover,
                  content: Text("Some quick example text to build on the card"),
                  buttonBar: GFButtonBar(
                    direction: Axis.vertical,
                    children: <Widget>[
                      GFButton(
                        onPressed: () {},
                        text: 'Some Answer',
                      ),
                      GFButton(
                        onPressed: () {},
                        text: 'Cancel',
                      ),
                      GFButton(
                        onPressed: () {},
                        text: 'Buy',
                      ),
                      GFButton(
                        onPressed: () {},
                        text: 'Buy',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
