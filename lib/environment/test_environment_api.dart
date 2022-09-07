import 'dart:io' show Platform;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class TestEnvironmentAPI{

  static const String localhost = 'localhost';
  static const int fireStorePort = 8080;
  static const int authPort = 9099;
  static const String fireStoreAndroidConnection = '10.0.2.2:1111';
  static const String fireStoreElseConnection = 'localhost:1111';

  // set up connection to firebase emulator when in debug mode
  static void setUpTestEnvironment(){

    if(kDebugMode){
      // Firestore emulator connection
      FirebaseFirestore.instance.settings = Settings(
          host: Platform.isAndroid ? fireStoreAndroidConnection : fireStoreElseConnection,
          sslEnabled: false,
          persistenceEnabled: false
      );

      // Auth emulator connection
      FirebaseAuth.instance.useAuthEmulator(TestEnvironmentAPI.localhost, authPort);
    }
  }
}