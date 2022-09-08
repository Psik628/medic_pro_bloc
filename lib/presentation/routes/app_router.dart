import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medic_pro_bloc/presentation/pages/category/category_page.dart';
import 'package:medic_pro_bloc/presentation/pages/home/home_page.dart';
import 'package:medic_pro_bloc/presentation/pages/profile/profile_page.dart';
import 'package:medic_pro_bloc/presentation/pages/sign_up/sign_up_page.dart';
import 'package:medic_pro_bloc/presentation/pages/settings/settings_page.dart';

import '../../domain/subject/category.dart';
import '../pages/sign_in/sign_in_page.dart';
import '../pages/splash/splash_page.dart';


part 'app_router.gr.dart';

@MaterialAutoRouter(
  routes: [
    MaterialRoute(page: SplashPage, initial: true),
    MaterialRoute(page: SignInPage),
    MaterialRoute(page: SignUpPage),
    MaterialRoute(page: HomePage),
    MaterialRoute(page: ProfilePage),
    MaterialRoute(page: SettingsPage),
    MaterialRoute(page: CategoryPage),
    // MaterialRoute(page: NoteFormPage, fullscreenDialog: true)
  ],
)
class AppRouter extends _$AppRouter{}