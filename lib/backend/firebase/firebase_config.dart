import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAmtjmeSs50nZe7dOxiEtvBV-ZKQzvkG3s",
            authDomain: "nitmess-cdf3e.firebaseapp.com",
            projectId: "nitmess-cdf3e",
            storageBucket: "nitmess-cdf3e.appspot.com",
            messagingSenderId: "168706578944",
            appId: "1:168706578944:web:f0bf7d0d29625f71e216e5",
            measurementId: "G-46VC5C9GLM"));
  } else {
    await Firebase.initializeApp();
  }
}
