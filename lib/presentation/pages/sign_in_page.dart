import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'dart:math' as math;

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        minimum: EdgeInsets.all(20),
        child: StaggeredGrid.count(
          crossAxisCount: 4,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          children: [
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 4,
              child: Container(color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0)),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 1,
              child: Container(color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0)),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: Container(color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0)),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: Container(color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0)),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 4,
              mainAxisCellCount: 2,
              child: Container(color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0)),
            ),
          ],
        )
      ),
    );
  }
}
