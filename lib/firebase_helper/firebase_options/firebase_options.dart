import 'dart:io';

import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseConfig {
  static FirebaseOptions get platformOptions {
    if (Platform.isIOS) {
      // iOS and MacOS
      return const FirebaseOptions(
        appId: '',
        apiKey: '',
        projectId: '',
        messagingSenderId: '',
        iosBundleId: '',
      );
    } else {
      // Android
      return const FirebaseOptions(
        appId: '1:1070100870368:android:6a91c7fe0993e57466cc85',
        apiKey: 'AIzaSyAx8LL1sq0upA5NjkalbVcUQjbjfDUZKjA',
        projectId: 'e-commerce-0660',
        messagingSenderId: '1070100870368',
      );
    }
  }
}