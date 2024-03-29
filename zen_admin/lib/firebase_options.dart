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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAeZowMh1b3h4iH7qAwAx9iHRSQu2IkOhQ',
    appId: '1:28093409666:android:644a7ffcd2b17eaa9f479b',
    messagingSenderId: '28093409666',
    projectId: 'zen-63012',
    databaseURL: 'https://zen-63012-default-rtdb.firebaseio.com',
    storageBucket: 'zen-63012.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC8jeF14EcAnJufwcZMUzeH_CcwKEOWGaQ',
    appId: '1:28093409666:ios:35a97532af2cf8709f479b',
    messagingSenderId: '28093409666',
    projectId: 'zen-63012',
    databaseURL: 'https://zen-63012-default-rtdb.firebaseio.com',
    storageBucket: 'zen-63012.appspot.com',
    iosClientId: '28093409666-13h3nqrgc0pcgpq72m0mkkr674es9o5t.apps.googleusercontent.com',
    iosBundleId: 'com.ajz.zen.ad.zenAdmin',
  );
}
