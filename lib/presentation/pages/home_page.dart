import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medic_pro_bloc/application/auth/auth_bloc.dart';
import 'package:medic_pro_bloc/presentation/routes/app_router.dart';
import '../../injection.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => getIt<AuthBloc>()..add(const AuthEvent.authCheckRequested()),
          )
        ],
        child: MultiBlocListener(
          listeners: [
            BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                if(state == const Unauthenticated()){
                  AutoRouter.of(context).replace(const SignInPageRoute());
                }
              },
            ),
          ],
          child: Text('this is home page'),
        )
    );
  }
}
