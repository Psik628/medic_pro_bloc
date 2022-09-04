// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDl538uQvtIVgaq3Bq2IQPOCCwoHO0JJDY',
    appId: '1:1047285584970:web:0aae2a3f0f08b7820502b3',
    messagingSenderId: '1047285584970',
    projectId: 'medicpro-9ff69',
    authDomain: 'medicpro-9ff69.firebaseapp.com',
    storageBucket: 'medicpro-9ff69.appspot.com',
    measurementId: 'G-GB7DC9HE3B',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBbiGKzDXGXMXgGRVNAsfHXnigaZFpAPlo',
    appId: '1:1047285584970:android:31e602d9059cd4c60502b3',
    messagingSenderId: '1047285584970',
    projectId: 'medicpro-9ff69',
    storageBucket: 'medicpro-9ff69.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBCXwNQx6pElIGxAo-utPk_OV18dKuqE_c',
    appId: '1:1047285584970:ios:fba3667793d3158e0502b3',
    messagingSenderId: '1047285584970',
    projectId: 'medicpro-9ff69',
    storageBucket: 'medicpro-9ff69.appspot.com',
    iosClientId: '1047285584970-qdapah9ggkr3m7jttpalrdtb2tvssd5f.apps.googleusercontent.com',
    iosBundleId: 'com.cahliksoftwaresolutions.medicProBloc',
  );
}
