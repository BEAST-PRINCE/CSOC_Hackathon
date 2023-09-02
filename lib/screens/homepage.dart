import 'package:flutter/material.dart';
import 'package:planet/screens/lognScreen.dart';
import 'package:planet/screens/planets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Planets(),
    );
  }
}
