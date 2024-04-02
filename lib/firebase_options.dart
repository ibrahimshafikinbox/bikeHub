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
    apiKey: 'AIzaSyA6k0TqQdl6XzsCq7GDcXDZvXw9633neyY',
    appId: '1:298995790748:web:0c3e8a80c2d6bed2e40e59',
    messagingSenderId: '298995790748',
    projectId: 'bikeshub-1c1b1',
    authDomain: 'bikeshub-1c1b1.firebaseapp.com',
    storageBucket: 'bikeshub-1c1b1.appspot.com',
    measurementId: 'G-RKF0LRJHMP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD8yML67sVjC927pKtpKW5oKk4ozQhjW-w',
    appId: '1:298995790748:android:868ababc92774888e40e59',
    messagingSenderId: '298995790748',
    projectId: 'bikeshub-1c1b1',
    storageBucket: 'bikeshub-1c1b1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAgGhacKVxTWjlBvUuJLgjC-JnFXChC-xI',
    appId: '1:298995790748:ios:3ea7af4d9e9b10a8e40e59',
    messagingSenderId: '298995790748',
    projectId: 'bikeshub-1c1b1',
    storageBucket: 'bikeshub-1c1b1.appspot.com',
    iosBundleId: 'com.example.bikehub',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAgGhacKVxTWjlBvUuJLgjC-JnFXChC-xI',
    appId: '1:298995790748:ios:a06a645d9c7a8446e40e59',
    messagingSenderId: '298995790748',
    projectId: 'bikeshub-1c1b1',
    storageBucket: 'bikeshub-1c1b1.appspot.com',
    iosBundleId: 'com.example.bikehub.RunnerTests',
  );
}
