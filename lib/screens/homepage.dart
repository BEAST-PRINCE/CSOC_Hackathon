import 'package:flutter/material.dart';
import 'package:planet/screens/loginScreen.dart';
import 'package:planet/screens/sun.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SunScreen(),
    );
  }
}
