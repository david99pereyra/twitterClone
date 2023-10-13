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
    apiKey: 'AIzaSyBBSyHNQLlpzPqe9PQMQzie0rGOsldS1ac',
    appId: '1:353971769035:web:5a9cf180402a5f2880d54e',
    messagingSenderId: '353971769035',
    projectId: 'prueba-df2e2',
    authDomain: 'prueba-df2e2.firebaseapp.com',
    databaseURL: 'https://prueba-df2e2-default-rtdb.firebaseio.com',
    storageBucket: 'prueba-df2e2.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDhpj_bd5V1oBU0acyQCU-OrEcof9rK_V8',
    appId: '1:353971769035:android:91bafc818ecc49b180d54e',
    messagingSenderId: '353971769035',
    projectId: 'prueba-df2e2',
    databaseURL: 'https://prueba-df2e2-default-rtdb.firebaseio.com',
    storageBucket: 'prueba-df2e2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC9X9Ry_BmqfNA8SsiNgIl-7JYNMvHUnmk',
    appId: '1:353971769035:ios:d4301ee02c03072380d54e',
    messagingSenderId: '353971769035',
    projectId: 'prueba-df2e2',
    databaseURL: 'https://prueba-df2e2-default-rtdb.firebaseio.com',
    storageBucket: 'prueba-df2e2.appspot.com',
    iosClientId: '353971769035-49mhohfaiqj5vv3vf7ner4p0t8etu6qp.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC9X9Ry_BmqfNA8SsiNgIl-7JYNMvHUnmk',
    appId: '1:353971769035:ios:9d1177c7a6e75bd680d54e',
    messagingSenderId: '353971769035',
    projectId: 'prueba-df2e2',
    databaseURL: 'https://prueba-df2e2-default-rtdb.firebaseio.com',
    storageBucket: 'prueba-df2e2.appspot.com',
    iosClientId: '353971769035-gatr38c8b4p4qk78rkk0lekiskh5iatv.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApplication1.RunnerTests',
  );
}
