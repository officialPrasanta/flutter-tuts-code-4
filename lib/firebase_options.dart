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
        return macos;
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
    apiKey: 'AIzaSyDmhWBA5nweeD3LPCyjc8etylTWH4tDzig',
    appId: '1:190247232384:web:93d471b86fbbfc8bc05765',
    messagingSenderId: '190247232384',
    projectId: 'ipsessions',
    authDomain: 'ipsessions.firebaseapp.com',
    storageBucket: 'ipsessions.appspot.com',
    measurementId: 'G-FM6DVTNQSS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDEWEP1lLh0XFrfr5-NwDTOoHY9Uktsd9U',
    appId: '1:190247232384:android:b02a52971e9cef06c05765',
    messagingSenderId: '190247232384',
    projectId: 'ipsessions',
    storageBucket: 'ipsessions.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBChm557qdUwqtUXm3UnryWgXNNR8p01Aw',
    appId: '1:190247232384:ios:13c23ac75361f2c4c05765',
    messagingSenderId: '190247232384',
    projectId: 'ipsessions',
    storageBucket: 'ipsessions.appspot.com',
    iosClientId: '190247232384-hoan5b1tc1epoa2rkqgf2gu7kmo0cpc9.apps.googleusercontent.com',
    iosBundleId: 'com.example.four',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBChm557qdUwqtUXm3UnryWgXNNR8p01Aw',
    appId: '1:190247232384:ios:13c23ac75361f2c4c05765',
    messagingSenderId: '190247232384',
    projectId: 'ipsessions',
    storageBucket: 'ipsessions.appspot.com',
    iosClientId: '190247232384-hoan5b1tc1epoa2rkqgf2gu7kmo0cpc9.apps.googleusercontent.com',
    iosBundleId: 'com.example.four',
  );
}