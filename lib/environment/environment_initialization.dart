// import 'dart:async';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:fcm_config/fcm_config.dart';
// import 'package:firebase_app_check/firebase_app_check.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:medic_pro/services/question_section_service.dart';
// import 'package:medic_pro/services/user_service.dart';
// import 'package:provider/provider.dart';
//
// import '../api/firebase_messaging_api.dart';
// import '../api/purchase_api.dart';
// import '../firebase_options.dart';
// import '../main.dart';
// import '../providers/question_section_provider.dart';
// import '../providers/ui_helper_provider.dart';
// import '../providers/user_provider.dart';
//
//
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   print("Handling a background message: ${message.messageId}");
// }
//
// class InitializationService{
//
//   static final PurchaseApi purchaseApi = PurchaseApi();
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
//   static Future<void> initializePurchaseAPI() async {
//     await purchaseApi.init();
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
//
//   static Future<void> initializeMessaging() async {
//     // todo integrate for apple https://firebase.flutter.dev/docs/messaging/apple-integration
//     FirebaseMessaging messaging = FirebaseMessaging.instance;
//
//     // On Android authorizationStatus will return authorized if the user has not disabled notifications for the app via the operating systems settings.
//     // therefore these lines of code are for apple, where we need to ask for permission
//     NotificationSettings settings = await messaging.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: true,
//       sound: true,
//     );
//     // background message
//     FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//     // plugin
//     await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(FirebaseMessagingApi.channel);
//     // foreground message settings
//     await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//         alert: true,
//         badge: true,
//         sound: true
//     );
//     if(kDebugMode){
//       // todo getting token for sending notifications
//       String? token = await FirebaseMessaging.instance.getToken();
//
//       print('[MESSAGING TOKEN] $token'); // used for sending test notifications
//
//       // getting id for in app messaging
//       //https://stackoverflow.com/questions/56767920/how-to-get-apps-instance-id-in-flutter
//     }
//   }
//
//   static Future<void> initializeApplication() async {
//     runZonedGuarded<Future<void>>(() async {
//       initializeWidgets();
//       await initializeFirebase();
//       await initializePurchaseAPI();
//       initializeCrashlytics();
//       // app check not used when using emulator
//       await initializeAppCheck();
//       await initializeMessaging();
//
//       // APP
//       runApp(
//           MultiProvider(
//               providers: [
//                 ChangeNotifierProvider(create: (_) => QuestionSectionProvider(QuestionSectionService())),
//                 ChangeNotifierProvider(create: (_) => UIHelperProvider()),
//                 ChangeNotifierProvider(create: (_) => UserProvider(UserService(FirebaseAuth.instance, FirebaseFirestore.instance))),
//                 // ChangeNotifierProvider(create: (_) => EntityProvider())
//               ],
//               child: MedicPro()
//           )
//       );
//     }, (error, stack) {
//       FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
//     });
//   }
// }