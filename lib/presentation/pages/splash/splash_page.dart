import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:medic_pro_bloc/presentation/routes/app_router.dart';

import '../../../application/auth/auth_bloc.dart';

/// used to check whether user is authenticated
class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state){
        state.map(
          initial: (_) => null,
          authenticated: (_) => AutoRouter.of(context).replace(const HomePageRoute()),
          unAuthenticated: (_) => AutoRouter.of(context).replace(const SignInPageRoute()),
        );
      },
      child: const Scaffold(
          body: Center(
              child: GFLoader()
          )
      ),
    );
  }
}
