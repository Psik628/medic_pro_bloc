import 'package:flutter/cupertino.dart';

import '../../../../domain/subject/option.dart';

class OptionWidget extends StatelessWidget {

  final Option currentOption;

  const OptionWidget({Key? key, required this.currentOption}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(currentOption.content);
  }
}
