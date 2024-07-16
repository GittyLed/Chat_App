import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseOptions{
  static FirebaseOptions get currentPlatform{
    return android;
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: "AIzaSyAiFB8s0ZYJPyO-9E1Muu4kCGUmHzhqOAs",
    appId: "1:65374796996:android:c212922a1ec32dff899d91",
    projectId: "chat-app-cdbad",
    messagingSenderId: "65374796996",
    storageBucket: "chat-app-cdbad.appspot.com",
    
  );
}