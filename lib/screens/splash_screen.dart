import 'dart:async';
import 'package:flutter/material.dart';
import 'package:planet/screens/loginScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen() ));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(width: double.infinity, height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/splashImages/back.png"),fit: BoxFit.fill)
      ),
        child: Center(
          child: Container(width: 400,height: 400,
            color: Colors.transparent,
            child: Image(image: AssetImage("assets/splashImages/earth.png"),),),
        ),
      ),

    );
  }
}

