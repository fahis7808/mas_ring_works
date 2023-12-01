// File: firebase_options.dart

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return androidOptions;
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return iosOptions;
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static const FirebaseOptions androidOptions = FirebaseOptions(
    apiKey: 'AIzaSyAIHey0YmX_wlKSzpJRwvPUR-rAb8hO4UU',
    authDomain: 'business-management-5dd75.firebaseapp.com',
    projectId: 'business-management-5dd75',
    storageBucket: 'business-management-5dd75.appspot.com',
    messagingSenderId: '211287828142',
    appId: '1:211287828142:android:d8795a92175343f485af3f',
  );

  static const FirebaseOptions iosOptions = FirebaseOptions(
    apiKey: 'YOUR_API_KEY',
    authDomain: 'YOUR_AUTH_DOMAIN',
    projectId: 'YOUR_PROJECT_ID',
    storageBucket: 'YOUR_STORAGE_BUCKET',
    messagingSenderId: 'YOUR_MESSAGING_SENDER_ID',
    appId: 'YOUR_APP_ID',
  );
}
