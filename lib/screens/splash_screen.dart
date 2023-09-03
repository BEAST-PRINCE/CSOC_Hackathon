import 'dart:async';
import 'package:flutter/material.dart';
import 'package:planet/screens/planets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double earthSize = 100.0; // Initial size of the Earth image

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Planets()));
    });


    startSizeAnimation();
  }


  void startSizeAnimation() async {
    await Future.delayed(Duration(milliseconds: 500)); // Delay before the animation starts
    setState(() {
      earthSize = 300.0; // New size for the Earth image
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/splashImages/back.png"), fit: BoxFit.fill),
        ),
        child: Center(
          child: AnimatedContainer(
            duration: Duration(milliseconds: 1000), // Duration of the animation
            width: earthSize,
            height: earthSize,
            curve: Curves.easeInOut, // Animation curve
            child: Image(image: AssetImage("assets/splashImages/earth.png")),
          ),
        ),
      ),
    );
  }
}