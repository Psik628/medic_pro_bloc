import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:medic_pro_bloc/application/question_section/question_section_bloc.dart';

import '../../../../domain/subject/option.dart';

class OptionWidget extends StatefulWidget {

  final Option currentOption;

  const OptionWidget({Key? key, required this.currentOption}) : super(key: key);

  @override
  State<OptionWidget> createState() => _OptionWidgetState();
}

class _OptionWidgetState extends State<OptionWidget> {

  bool isSelected = false;
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // bloc is provided in MultiBlocProvider in app_widget.dart
        // BlocBuilder<QuestionSectionBloc, QuestionSectionState>(
        //   builder: (context, state) {
        //     return Expanded(
        //         child: GFButton(
        //           fullWidthButton: true,
        //           onPressed: () {
        //             setState(() {
        //               isSelected = !isSelected;
        //             });
        //             if(isSelected){
        //               context.read<QuestionSectionBloc>().add(QuestionSectionEvent.selectOption(option: widget.currentOption));
        //             }else{
        //               context.read<QuestionSectionBloc>().add(QuestionSectionEvent.unSelectOption(option: widget.currentOption));
        //             }
        //           },
        //           child: Text(widget.currentOption.content),
        //         )
        //     );
        //   },
        // ),
        Expanded(
          child: GFButton(
          fullWidthButton: true,
            onPressed: () {
              setState(() {
                isSelected = !isSelected;
              });
              if(isSelected){
                context.read<QuestionSectionBloc>().add(QuestionSectionEvent.selectOption(option: widget.currentOption));
              }else{
                context.read<QuestionSectionBloc>().add(QuestionSectionEvent.unSelectOption(option: widget.currentOption));
              }
            },
            child: Text(widget.currentOption.content),
          )
        )
      ],
    );
  }
}
