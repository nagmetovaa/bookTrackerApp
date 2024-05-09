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
    apiKey: 'AIzaSyB82Y88R8wOp2KJTF5yncYMvJaarhqyad0',
    appId: '1:775234155731:android:299ba8f8dd878d78335026',
    messagingSenderId: '775234155731',
    projectId: 'booktracker-40157',
    authDomain: 'booktracker-40157.firebaseapp.com',
    storageBucket: 'booktracker-40157.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB82Y88R8wOp2KJTF5yncYMvJaarhqyad0',
    appId: '1:775234155731:android:299ba8f8dd878d78335026',
    messagingSenderId: '775234155731',
    projectId: 'booktracker-40157',
    storageBucket: 'booktracker-40157.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDTcjAptFUS8ws15GS1loSur_M_PulpjAQ',
    appId: '1:775234155731:ios:e2f716abbc3f5d1a335026',
    messagingSenderId: '775234155731',
    projectId: 'booktracker-40157',
    storageBucket: 'booktracker-40157.appspot.com',
    iosBundleId: 'com.example.bookTracker',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDTcjAptFUS8ws15GS1loSur_M_PulpjAQ',
    appId: '1:775234155731:ios:e2f716abbc3f5d1a335026',
    messagingSenderId: '775234155731',
    projectId: 'booktracker-40157',
    storageBucket: 'booktracker-40157.appspot.com',
    iosBundleId: 'com.example.bookTracker.RunnerTests',
  );
}
