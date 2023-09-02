import 'package:flutter/material.dart';

class Planets extends StatefulWidget {
  const Planets({super.key});

  @override
  State<Planets> createState() => _PlanetsState();
}

class _PlanetsState extends State<Planets> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/sun.png"), fit: BoxFit.fill),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [SizedBox(height: 50,),
          Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton.extended(
                label: const Text(
                  "Latest\nMission  ",
                  style: TextStyle(fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                splashColor: Colors.cyan,
                onPressed: () {}),
            SizedBox(
              width: 150,
            ),
            FloatingActionButton.extended(
                label: const Text(
                  "Upcoming\nMission",
                  style: TextStyle(fontWeight: FontWeight.w500,),
                  textAlign: TextAlign.center,
                ),
                splashColor: Colors.cyan,
                onPressed: () {}),
          ],
        ),
          SizedBox(
            height: 550,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton.extended(
                  label: const Text(
                    "Latest\nMission  ",
                    style: TextStyle(fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                  splashColor: Colors.cyan,
                  onPressed: () {}),
              SizedBox(
                width: 150,
              ),
              FloatingActionButton.extended(
                  label: const Text(
                    "Upcoming\nMission",
                    style: TextStyle(fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                  splashColor: Colors.cyan,
                  onPressed: () {}),
            ],
          )
        ],
      ),
    );
  }
}

