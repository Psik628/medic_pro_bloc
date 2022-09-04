import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:medic_pro_bloc/config_reader.dart';
import 'package:medic_pro_bloc/presentation/core/app_widget.dart';

import 'firebase_options.dart';
import 'injection.dart';

Future<void> mainCommon(String env) async {
  WidgetsFlutterBinding.ensureInitialized();
  await ConfigReader.initialize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  configureDependencies(); // dependency injections

  late final Color primaryColor;

  switch(env){
    case Environment.dev:
      primaryColor = Colors.blue;
      break;
    case Environment.prod:
      primaryColor = Colors.red;
      break;
  }

  runApp(AppWidget());
}