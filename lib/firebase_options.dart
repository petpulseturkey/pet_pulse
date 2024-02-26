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
    apiKey: 'AIzaSyCznOwkkWohi_u0Mo3rljIXhhQzaI5ea-U',
    appId: '1:342430192384:web:7fb4779ac6cbb64ea459e5',
    messagingSenderId: '342430192384',
    projectId: 'petpulse-37d67',
    authDomain: 'petpulse-37d67.firebaseapp.com',
    storageBucket: 'petpulse-37d67.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCqkN8BP_rlGyKK-ffTeoFtpdNCPBUdlXA',
    appId: '1:342430192384:android:5492afca11590e3fa459e5',
    messagingSenderId: '342430192384',
    projectId: 'petpulse-37d67',
    storageBucket: 'petpulse-37d67.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBtzfDUaQViCkhoqIcJ-ECiUyZCHR-8kBo',
    appId: '1:342430192384:ios:e576bb152649bdcda459e5',
    messagingSenderId: '342430192384',
    projectId: 'petpulse-37d67',
    storageBucket: 'petpulse-37d67.appspot.com',
    iosClientId: '342430192384-9trivnvsh5m8giiqfv9m0stuvm7k9u23.apps.googleusercontent.com',
    iosBundleId: 'com.example.petPulse',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBtzfDUaQViCkhoqIcJ-ECiUyZCHR-8kBo',
    appId: '1:342430192384:ios:4f6b245058ed6923a459e5',
    messagingSenderId: '342430192384',
    projectId: 'petpulse-37d67',
    storageBucket: 'petpulse-37d67.appspot.com',
    iosClientId: '342430192384-m9e02ugledk3s8mssg6af5ac41f1pcha.apps.googleusercontent.com',
    iosBundleId: 'com.example.petPulse.RunnerTests',
  );
}
