import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:planet/screens/description.dart';
import 'package:planet/screens/neptune.dart';

import '../services/networking.dart';

class Planet {
  final String? name;
  final String imagePath;
  final String? mass;
  final int? moons;
  final String? rotation_period;
  final String? atmosphere;
  final String? description;

  Planet({
    required this.name,
    required this.imagePath,
    this.mass,
    this.moons,
    this.rotation_period,
    this.atmosphere,
    this.description,
  });
}

class Planets extends StatefulWidget {
  Planets({super.key});

  @override
  State<Planets> createState() => _PlanetsState();
}

class _PlanetsState extends State<Planets> {
  late int currentPlanetIndex;
  var planetData;
  bool isLoading = true;

  final List<Planet> planets_list = [];

  Future<dynamic> getData() async {
    var uri = Uri.parse('https://csoc-a3-api-2.onrender.com/planetdetails');

    NetworkHelper networkHelper = NetworkHelper(uri);

    planetData = await networkHelper.getData();
    print(planetData);
    setState(() {
      isLoading = false;
    });
    addPlanet();
  }

  void addPlanet() {
    for (var planet in planetData) {
      print(planet);
      planets_list.add(Planet(
          name: planet["planet_name"] ?? "Unknown",
          imagePath: "assets/images/${planet["planet_name"] ?? "Unknown"}.png",
          mass: planet["mass"],
          moons: planet["confirmed_moons"],
          rotation_period: planet["rotation_period"],
          atmosphere: planet["atmosphere"],
          description: planet["description"]));
    }
  }

  void buildPlanet(int nav) {
    if ((nav == 1 && currentPlanetIndex < 9) ||
        (nav == -1 && currentPlanetIndex > 0)) {
      currentPlanetIndex += nav;
      setState(() {});
    } else if (currentPlanetIndex == 0 && nav == -1) {}
  }

  Widget buildButton(int nav) {
    return Container(
      width: 150,
      height: 150,
      child: InkWell(
        focusColor: Colors.deepPurple,
        child: Ink.image(
            image: AssetImage(planets_list[currentPlanetIndex].imagePath)),
        onTap: () {
          setState(() {
            buildPlanet(nav);
          });
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    currentPlanetIndex = 0;
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: !isLoading
          ? Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        "assets/images/${planets_list[currentPlanetIndex].name}Screen.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 80,
              left: 0,
              right: 0,
              child: Center(
                child: Column(
                  children: [
                    Text(
                      planets_list[currentPlanetIndex].name!,
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Description(
                                planets_list[currentPlanetIndex]),
                          ),
                        );
                      },
                      child: Text("Show Details"),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 30,
              bottom: 30,
              child: FloatingActionButton(
                backgroundColor: Colors.deepPurple,
                onPressed: () {
                  setState(() {
                    buildPlanet(-1);
                  });
                },
                child: Icon(Icons.arrow_back),
              ),
            ),
            Positioned(
              right: 30,
              bottom: 30,
              child: FloatingActionButton(
                backgroundColor: Colors.deepPurple,
                onPressed: () {
                  setState(() {
                    buildPlanet(1);
                  });
                },
                child: Icon(Icons.arrow_forward),
              ),
            ),
          ],
        ),
      )
          : Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}