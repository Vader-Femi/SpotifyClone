// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyBM-2nZ3P86qd-SnsXnqefvHsjKk4UHstM',
    appId: '1:762342442213:web:33d1a176151da4dbb0c00c',
    messagingSenderId: '762342442213',
    projectId: 'spotifyclone-flutter',
    authDomain: 'spotifyclone-flutter.firebaseapp.com',
    storageBucket: 'spotifyclone-flutter.appspot.com',
    measurementId: 'G-6Y4K55SBY9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB9iDuJJdT_6iANQU2GgKMXIFPEB86W-zM',
    appId: '1:762342442213:android:3643579547514bd0b0c00c',
    messagingSenderId: '762342442213',
    projectId: 'spotifyclone-flutter',
    storageBucket: 'spotifyclone-flutter.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAbfrK26OuDlVpQYwu0FSqLVTlSRVpI1Is',
    appId: '1:762342442213:ios:bb762e5943fb5319b0c00c',
    messagingSenderId: '762342442213',
    projectId: 'spotifyclone-flutter',
    storageBucket: 'spotifyclone-flutter.appspot.com',
    iosBundleId: 'com.example.spotifyClone',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAbfrK26OuDlVpQYwu0FSqLVTlSRVpI1Is',
    appId: '1:762342442213:ios:bb762e5943fb5319b0c00c',
    messagingSenderId: '762342442213',
    projectId: 'spotifyclone-flutter',
    storageBucket: 'spotifyclone-flutter.appspot.com',
    iosBundleId: 'com.example.spotifyClone',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBM-2nZ3P86qd-SnsXnqefvHsjKk4UHstM',
    appId: '1:762342442213:web:898745d41f9dfe2bb0c00c',
    messagingSenderId: '762342442213',
    projectId: 'spotifyclone-flutter',
    authDomain: 'spotifyclone-flutter.firebaseapp.com',
    storageBucket: 'spotifyclone-flutter.appspot.com',
    measurementId: 'G-J8243JR52S',
  );
}
