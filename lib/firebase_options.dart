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
    apiKey: 'AIzaSyACUY8QqwV3lkuZOCs9MULb8gKCfxrhHOk',
    appId: '1:531608785984:web:ae4819eb60fce4901ffba5',
    messagingSenderId: '531608785984',
    projectId: 'lojavirtualprojetoifal',
    authDomain: 'lojavirtualprojetoifal.firebaseapp.com',
    storageBucket: 'lojavirtualprojetoifal.appspot.com',
    measurementId: 'G-LX21QQFD11',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDaxE9NNp_Ecp-9KG7zTuNsy2LXySop67w',
    appId: '1:531608785984:android:abee1a38ecf190241ffba5',
    messagingSenderId: '531608785984',
    projectId: 'lojavirtualprojetoifal',
    storageBucket: 'lojavirtualprojetoifal.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCRgnzrnNzn3ms8mFmKJqorLT9FsdzdCx8',
    appId: '1:531608785984:ios:952307248f5cd1531ffba5',
    messagingSenderId: '531608785984',
    projectId: 'lojavirtualprojetoifal',
    storageBucket: 'lojavirtualprojetoifal.appspot.com',
    iosClientId: '531608785984-s4aim04ca1s6an7fhvrl8oqgcimsfqs2.apps.googleusercontent.com',
    iosBundleId: 'com.example.libelulas',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCRgnzrnNzn3ms8mFmKJqorLT9FsdzdCx8',
    appId: '1:531608785984:ios:fbe24183e9850b6a1ffba5',
    messagingSenderId: '531608785984',
    projectId: 'lojavirtualprojetoifal',
    storageBucket: 'lojavirtualprojetoifal.appspot.com',
    iosClientId: '531608785984-k9l3t21of83nl403pcs4h5f3fr4fmdej.apps.googleusercontent.com',
    iosBundleId: 'com.example.libelulas.RunnerTests',
  );
}
