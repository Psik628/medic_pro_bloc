import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medic_pro_bloc/application/question_section/question_section_bloc.dart';

import '../../application/auth/auth_bloc.dart';
import '../../application/sign_in/sign_in_bloc.dart';
import '../../injection.dart';
import '../routes/app_router.dart';

final theme1 = ThemeData();

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
          BlocProvider(create: (context) => getIt<SignInBloc>()),
          BlocProvider(create: (context) => getIt<QuestionSectionBloc>())
        ],
        child: MaterialApp.router(
          // easy localization
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: ThemeData.dark(),
          routerDelegate: _appRouter.delegate(),
          routeInformationParser: _appRouter.defaultRouteParser(),
          debugShowCheckedModeBanner: false,
          // todo rename
          title: 'Material App',
        ),
      );
  }
}