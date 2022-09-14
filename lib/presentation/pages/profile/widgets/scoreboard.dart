import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScoreboardWidget extends StatelessWidget {

  const ScoreboardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Row(
            children: [
              // todo extract this
              SizedBox(
                width: 20,
                height: 20,
                child: Image.asset('assets/biology.png'),
                // child: Image.asset('assets/${heading == BIOLOGY_LABEL ? BIOLOGY : heading == CHEMISTRY_LABEL ? CHEMISTRY : heading == PHYSICS_LABEL ? PHYSICS : OVERALL}.png'),
              ),
              Text(
                  "Biologie",
                  // style: TextStyle(
                  //     fontSize: heading == OVERALL_LABEL ? kCardOverallFontSize : kCardFontSize)
              ),
            ],
          )
        ],
      )
    );
  }
}
