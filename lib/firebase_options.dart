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
    apiKey: 'AIzaSyCDTQLxZPV2p2MTQkqqA68t5elYZIC6-ok',
    appId: '1:453974080277:web:7124a137f35dc933bfc71c',
    messagingSenderId: '453974080277',
    projectId: 'auctionapp-37650',
    authDomain: 'auctionapp-37650.firebaseapp.com',
    storageBucket: 'auctionapp-37650.appspot.com',
    measurementId: 'G-9LYZS1462Y',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDuLz-utSFyAeBsMPoHlVhxKxuV2g5kofA',
    appId: '1:453974080277:android:49ac533f6f17de4ebfc71c',
    messagingSenderId: '453974080277',
    projectId: 'auctionapp-37650',
    storageBucket: 'auctionapp-37650.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBmw9lJ47o26gcj-ccZxSIZYPU8N_VWhgY',
    appId: '1:453974080277:ios:47e97d7fb3726f34bfc71c',
    messagingSenderId: '453974080277',
    projectId: 'auctionapp-37650',
    storageBucket: 'auctionapp-37650.appspot.com',
    iosClientId: '453974080277-bkanogteevqkneg0e6fsufvfb3n8us8d.apps.googleusercontent.com',
    iosBundleId: 'com.example.auctionApp',
  );
}
