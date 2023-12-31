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
    apiKey: 'AIzaSyAF6W-xZq2WRwPRxODdG9n15IFDRSAWdpo',
    appId: '1:229636779085:web:188bf2c7b426790e834004',
    messagingSenderId: '229636779085',
    projectId: 'todo-cb983',
    authDomain: 'todo-cb983.firebaseapp.com',
    storageBucket: 'todo-cb983.appspot.com',
    measurementId: 'G-VQKTCXNP5K',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDe3MVk971mZME6FXkFMi0oCeTaoE1oe80',
    appId: '1:229636779085:android:48e802b6440c974d834004',
    messagingSenderId: '229636779085',
    projectId: 'todo-cb983',
    storageBucket: 'todo-cb983.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA303LW3fJ3MFp3SonF17o3TytpWyC4GU4',
    appId: '1:229636779085:ios:978bef5c2a78e8f6834004',
    messagingSenderId: '229636779085',
    projectId: 'todo-cb983',
    storageBucket: 'todo-cb983.appspot.com',
    iosBundleId: 'com.fluttermuhriddin2022.blocTodo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA303LW3fJ3MFp3SonF17o3TytpWyC4GU4',
    appId: '1:229636779085:ios:7fe604d82801fee2834004',
    messagingSenderId: '229636779085',
    projectId: 'todo-cb983',
    storageBucket: 'todo-cb983.appspot.com',
    iosBundleId: 'com.fluttermuhriddin2022.blocTodo.RunnerTests',
  );
}
