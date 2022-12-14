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
    apiKey: 'AIzaSyADeY1OG4OL2buWy3CCxTBDCUX8zPQ7gso',
    appId: '1:538558528527:web:74467bb673eda984e1b77a',
    messagingSenderId: '538558528527',
    projectId: 'chatty-flutter-muyu',
    authDomain: 'chatty-flutter-muyu.firebaseapp.com',
    storageBucket: 'chatty-flutter-muyu.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD8a74ZWIjkKF4bACkSTLa0j8uYUnp91No',
    appId: '1:538558528527:android:097d6cd820d42465e1b77a',
    messagingSenderId: '538558528527',
    projectId: 'chatty-flutter-muyu',
    storageBucket: 'chatty-flutter-muyu.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB_xeKoFWaH6eKVPKGMQSf9ucHJKXUlcDA',
    appId: '1:538558528527:ios:508275468c579acae1b77a',
    messagingSenderId: '538558528527',
    projectId: 'chatty-flutter-muyu',
    storageBucket: 'chatty-flutter-muyu.appspot.com',
    iosClientId: '538558528527-f2oorkfasvbk0nfm3pgh95isoke27ddc.apps.googleusercontent.com',
    iosBundleId: 'com.muhuiyu.flutterChatroom',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB_xeKoFWaH6eKVPKGMQSf9ucHJKXUlcDA',
    appId: '1:538558528527:ios:40d30a2082b963c2e1b77a',
    messagingSenderId: '538558528527',
    projectId: 'chatty-flutter-muyu',
    storageBucket: 'chatty-flutter-muyu.appspot.com',
    iosClientId: '538558528527-40fcke996hcq3gf368bpv2dbk9mo07ct.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp',
  );
}
