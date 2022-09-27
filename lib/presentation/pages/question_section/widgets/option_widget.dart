import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/getwidget.dart';
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
        Expanded(
          child: GFButton(
            fullWidthButton: true,
            shape: isSelected ? GFButtonShape.pills : GFButtonShape.square,
            color: context.watch<QuestionSectionBloc>().state.displayResults ? (widget.currentOption.correct ? GFColors.SUCCESS : GFColors.DANGER) : isSelected ? GFColors.FOCUS : GFColors.INFO,
            onPressed: () {
              if(!context.read<QuestionSectionBloc>().state.displayResults){
                // options can not be change after user pressed the answer button
                setState(() {
                  isSelected = !isSelected;
                });
                if(isSelected){
                  context.read<QuestionSectionBloc>().add(QuestionSectionEvent.selectOption(option: widget.currentOption));
                }else{
                  context.read<QuestionSectionBloc>().add(QuestionSectionEvent.unSelectOption(option: widget.currentOption));
                }
              }
            },
            child: Text(widget.currentOption.content),
          )
        )
      ],
    );
  }
}
