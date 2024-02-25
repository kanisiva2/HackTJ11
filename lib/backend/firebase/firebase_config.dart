import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBR5RJ72nmY8RiUzneCQa4xD36E6ZVXlYA",
            authDomain: "please-work-emdapr.firebaseapp.com",
            projectId: "please-work-emdapr",
            storageBucket: "please-work-emdapr.appspot.com",
            messagingSenderId: "351142468345",
            appId: "1:351142468345:web:b66862c9c75dadc0f6e028"));
  } else {
    await Firebase.initializeApp();
  }
}
