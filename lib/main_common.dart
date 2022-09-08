import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:medic_pro_bloc/presentation/core/app_widget.dart';

import 'firebase_options.dart';
import 'injection.dart';

Future<void> mainCommon(String env) async {
  // can access env variable to set specific properties to dev/prod mode

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  configureDependencies(); // dependency injections
  runApp(
      EasyLocalization(
          supportedLocales: const [
            Locale('en', 'US'),
            Locale('cs', 'CZ')
          ],
          path: 'lang',
          child: AppWidget()
      )
  );
}