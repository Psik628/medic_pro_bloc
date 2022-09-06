import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medic_pro_bloc/presentation/pages/home_page.dart';
import 'package:medic_pro_bloc/presentation/pages/profile_page.dart';
import 'package:medic_pro_bloc/presentation/pages/sign_up_page.dart';
import 'package:medic_pro_bloc/presentation/pages/settings_page.dart';

import '../pages/sign_in/sign_in_page.dart';
import '../pages/splash_page.dart';


part 'app_router.gr.dart';

@MaterialAutoRouter(
  routes: [
    MaterialRoute(page: SplashPage, initial: true),
    MaterialRoute(page: SignInPage),
    MaterialRoute(page: SignUpPage),
    MaterialRoute(page: HomePage),
    MaterialRoute(page: ProfilePage),
    MaterialRoute(page: SettingsPage),
    // MaterialRoute(page: NoteFormPage, fullscreenDialog: true)
  ],
)
class AppRouter extends _$AppRouter{}