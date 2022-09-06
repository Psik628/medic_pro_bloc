import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medic_pro_bloc/presentation/pages/sign_in/widgets/sign_in_form.dart';
import 'package:medic_pro_bloc/presentation/ui_constants.dart';

import '../../core/app_bar.dart';


// child: StaggeredGrid.count(
//   crossAxisCount: 4,
//   mainAxisSpacing: 4,
//   crossAxisSpacing: 4,
//   children: [
//     StaggeredGridTile.count(
//       crossAxisCellCount: 2,
//       mainAxisCellCount: 4,
//       child: Container(color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0)),
//     ),
//     StaggeredGridTile.count(
//       crossAxisCellCount: 2,
//       mainAxisCellCount: 1,
//       child: Container(color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0)),
//     ),
//     StaggeredGridTile.count(
//       crossAxisCellCount: 1,
//       mainAxisCellCount: 1,
//       child: Container(color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0)),
//     ),
//     StaggeredGridTile.count(
//       crossAxisCellCount: 1,
//       mainAxisCellCount: 1,
//       child: Container(color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0)),
//     ),
//     StaggeredGridTile.count(
//       crossAxisCellCount: 4,
//       mainAxisCellCount: 2,
//       child: Container(color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0)),
//     ),
//   ],
// )

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Bar.returnAppBar(),
      body: SafeArea(
          minimum: EdgeInsets.symmetric(
              vertical: UIConstants.safeAreaPaddingVertical,
              horizontal: UIConstants.safeAreaPaddingHorizontal
          ),
          child: const SignInForm()
      ),
    );
  }
}
