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
    apiKey: 'AIzaSyDgGfgw5mR4I_q07myWe7tYKerddMe3gtI',
    appId: '1:277788895198:web:560c12521bd66cc2a75f4f',
    messagingSenderId: '277788895198',
    projectId: 'shopify-37f08',
    authDomain: 'shopify-37f08.firebaseapp.com',
    storageBucket: 'shopify-37f08.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBn59a-Es9e43NSa7OvVk9MgQDhiuSVd9c',
    appId: '1:277788895198:android:ceff552107e25a23a75f4f',
    messagingSenderId: '277788895198',
    projectId: 'shopify-37f08',
    storageBucket: 'shopify-37f08.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBScTKlNbDeRGqqAn8HVg-mVVy8nSjWn2E',
    appId: '1:277788895198:ios:729cc08bcf0fc612a75f4f',
    messagingSenderId: '277788895198',
    projectId: 'shopify-37f08',
    storageBucket: 'shopify-37f08.appspot.com',
    iosClientId: '277788895198-et1gokn8g6dre1b8grr16srv84n2kvbk.apps.googleusercontent.com',
    iosBundleId: 'com.example.shopify',
  );
}
