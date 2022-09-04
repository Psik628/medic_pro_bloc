import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/auth/auth_bloc.dart';
import '../../injection.dart';
import '../routes/app_router.dart';

class AppWidget extends StatelessWidget {

  final _appRouter = AppRouter();

  AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return
      MultiBlocProvider(
        providers: [
          // check if user is signed in as soon as possible
          BlocProvider(create: (context) => getIt<AuthBloc>()..add(const AuthEvent.authCheckRequested())),
          // BlocProvider(create: (context) => getIt<SignInFormBloc>())
        ],
        child: MaterialApp.router(
          routerDelegate: _appRouter.delegate(),
          routeInformationParser: _appRouter.defaultRouteParser(),
          debugShowCheckedModeBanner: false,
          title: 'Material App',
        ),
      );
  }
}