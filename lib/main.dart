import 'dart:async';

import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:medic_pro_bloc/presentation/core/app_widget.dart';
import 'injection.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  configureDependencies(); // dependency injections
  runApp(AppWidget());
}

// class EnvironmentInitializationService{
//   static Future<void> initializeApplication() async {
//     runZonedGuarded<Future<void>>(() async {
//       initializeWidgets();
//       await initializeFirebase();
//       // todo later use
//       // await initializePurchaseAPI();
//       initializeCrashlytics();
//       // app check not used when using emulator
//       await initializeAppCheck();
//       // todo for later use
//       // await initializeMessaging();
//
//       // // APP
//       // runApp(
//       //     MultiProvider(
//       //         providers: [
//       //           ChangeNotifierProvider(create: (_) => QuestionSectionProvider(QuestionSectionService())),
//       //           ChangeNotifierProvider(create: (_) => UIHelperProvider()),
//       //           ChangeNotifierProvider(create: (_) => UserProvider(UserService(FirebaseAuth.instance, FirebaseFirestore.instance))),
//       //           // ChangeNotifierProvider(create: (_) => EntityProvider())
//       //         ],
//       //         child: MedicPro()
//       //     )
//       // );
//     }, (error, stack) {
//       FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
//     });
//   }
//
//   static void initializeWidgets(){
//     WidgetsFlutterBinding.ensureInitialized();
//   }
//
//   static Future<void> initializeFirebase() async {
//     await Firebase.initializeApp(
//       options: DefaultFirebaseOptions.currentPlatform,
//     );
//   }
//
//   static void initializeCrashlytics(){
//     FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
//     if(kDebugMode){
//       FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
//     }else{
//       FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
//     }
//     // todo provide some real user identifier
//     FirebaseCrashlytics.instance.setUserIdentifier("12345");
//   }
//
//   static Future<void> initializeAppCheck() async {
//     await FirebaseAppCheck.instance.activate();
//     // getting debug token
//     // app check fix from https://stackoverflow.com/questions/69498344/unable-to-get-appcheck-debug-on-emulator-to-work-on-a-flutter-application
//     if (kDebugMode) {
//       try {
//         const MethodChannel methodChannel = MethodChannel("method-channel");
//         await methodChannel.invokeMethod("getFirebaseAppCheckDebugToken");
//       } catch (e) {
//         print("FirebaseAppCheck debug token error: $e");
//       }
//     }
//   }
// }
