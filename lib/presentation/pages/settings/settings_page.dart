import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:medic_pro_bloc/application/auth/auth_bloc.dart';

import '../../../application/navigation/navigation_bloc.dart';
import '../../../translations_constants.dart';
import '../../core/app_bar.dart';
import '../../core/bottom_navigation.dart';
import '../../routes/app_router.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Bar.returnAppBar(),
        bottomNavigationBar: BlocProvider<NavigationBloc>(
          create: (context) => NavigationBloc(),
          child: BottomNavigation(currentIndex: 2),
        ),
        body: Column(
          children: [
            ListTile(
                title: const Text(TranslationsConstants.changeUsername).tr()
            ),
            ListTile(
                title: const Text(TranslationsConstants.changeEmail).tr()
            ),
            ListTile(
                title: const Text(TranslationsConstants.changePassword).tr()
            ),
            Spacer(),
            ListTile(
                title: BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return GFButton(
                      fullWidthButton: true,
                      onPressed: () {
                        context.read<AuthBloc>().add(const AuthEvent.signedOut());
                        AutoRouter.of(context).push(const SignInPageRoute());
                      },
                      child: const Text(TranslationsConstants.signOut).tr(),
                    );
                  },
                )
            )
          ],
        )
    );
  }
}