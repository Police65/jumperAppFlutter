import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyC_w0pn0Sw3bsfrjsxwNp4bVdNTWdMe-sA",
            authDomain: "task2-hznetm.firebaseapp.com",
            projectId: "task2-hznetm",
            storageBucket: "task2-hznetm.appspot.com",
            messagingSenderId: "266315338400",
            appId: "1:266315338400:web:ab739969abf0ff81542fc5"));
  } else {
    await Firebase.initializeApp();
  }
}
