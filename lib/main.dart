import 'package:flutter/material.dart';
import 'package:planet/screens/homepage.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:planet/screens/splash_screen.dart';

Future main() async{
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // to show the opening loading screen till all the initializations take place
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options :const FirebaseOptions(
      apiKey: "apiKey",
      appId: "appId",
      messagingSenderId: "messagingSenderId",
      projectId: "projectId"));
  // Duration for the opening loading screen
  // Future.delayed(const Duration(seconds: 5)).then((value) => FlutterNativeSplash.remove());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: SplashScreen(),
    );
  }
}
