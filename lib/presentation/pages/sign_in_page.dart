import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:medic_pro_bloc/application/sign_in/sign_in_bloc.dart';
import 'package:medic_pro_bloc/presentation/labels.dart';
import 'package:medic_pro_bloc/presentation/routes/app_router.dart';
import 'package:medic_pro_bloc/presentation/ui_constants.dart';
import 'dart:math' as math;

import '../../application/auth/auth_bloc.dart';
import '../../domain/auth/auth_failure.dart';
import '../core/app_bar.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Bar.returnAppBar(),
      body: SafeArea(
          minimum: EdgeInsets.symmetric(
              vertical: UIConstants.safeAreaPaddingVertical,
              horizontal: UIConstants.safeAreaPaddingHorizontal),
          child: BlocConsumer<SignInBloc, SignInState>(
            listener: (context, state) {
              if(state.authFailure != null && state.authFailure != const AuthFailure.initial()){
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('failed to authenticate'))
                );
              }else if(state.authFailure == null){
                // authFailure can not be initial, must change to null in process
                AutoRouter.of(context).push(const HomePageRoute());
                // adding event to another bloc
                context.read<AuthBloc>().add(const AuthEvent.authCheckRequested());
              }
            },
            // todo implement build when
            builder: (context, state) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(Labels.title),
                    Form(
                      // todo implement auto validate option
                      child: Column(
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              labelText: Labels.email,
                            ),
                          ),
                          TextFormField(
                            obscureText: true,
                            decoration: const InputDecoration(
                              labelText: Labels.password,
                            ),
                          ),
                          GFButton(
                            onPressed: () {
                              //
                            },
                            color: GFColors.SUCCESS,
                            fullWidthButton: true,
                            child: Text(Labels.signIn),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          )
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
      ),
    );
  }
}
