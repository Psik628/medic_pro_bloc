import 'package:flutter/cupertino.dart';
import 'package:getwidget/components/button/gf_button.dart';

import '../../../../domain/subject/option.dart';

class OptionWidget extends StatelessWidget {

  final Option currentOption;

  const OptionWidget({Key? key, required this.currentOption}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: GFButton(
              fullWidthButton: true,
              onPressed: () {  },
              child: Text(currentOption.content),
            )
        ),
      ],
    );
  }
}
