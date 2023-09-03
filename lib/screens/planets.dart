// import 'package:flutter/material.dart';
// import 'package:planet/screens/neptune.dart';
//
// class Planets extends StatefulWidget {
//   const Planets({super.key});
//
//   @override
//   State<Planets> createState() => _PlanetsState();
// }
//
// class _PlanetsState extends State<Planets> {
//
//   var current_planet = "Mercury";
//   late int current_planet_number;
//   var list_of_planets = ["Sun",
//     "Mercury",
//     " Venus",
//     "Earth",
//     "Moon",
//     "Jupiter",
//     "Saturn",
//     "Uranus",
//     "Neptune"
//   ];
//   var previous_planet;
//   var next_planet;
//
//   void buildPlanet(int current_planet_num, int nav) {
//     if (current_planet_num > 0) {
//       current_planet = list_of_planets[0 + nav];
//       current_planet_number = current_planet_num + nav;
//       previous_planet = list_of_planets[current_planet_number - 1];
//     } else if (current_planet_num == 0 && nav == -1) {
//       Navigator.pop(context);
//     }else if (current_planet_num == 8){
//       Navigator.push(context, MaterialPageRoute(builder: (context) => NeptuneScreen()),);
//     }
//   }
//
//   Widget buildButton(int nav, var planet){
//     return InkWell(
//       child: Ink.image(image: AssetImage("assets/images/$planet.png"),),
//       onTap: (){
//         setState(() {
//           buildPlanet(current_planet_number, nav);
//         });
//       },
//     );
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     current_planet_number = 1;
//     current_planet = list_of_planets[current_planet_number];
//     previous_planet = "Sun";
//     next_planet = list_of_planets[current_planet_number];
//   }
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           width: double.infinity,
//           height: double.infinity,
//           decoration: BoxDecoration(
//             image: DecorationImage(
//                 image: AssetImage("assets/images/"+"$current_planet+Screen"+".png"),
//                 fit: BoxFit.fill),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [SizedBox(height: 50,),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 buildButton(-1, current_planet),
//                 const SizedBox(
//                  width: 150,
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 550,
//              ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [buildButton(-1, previous_planet),
//                 const SizedBox(
//                   width: 150,
//                 ),
//               buildButton(1, next_planet),
//             ],
//            )
//          ],
//         ),
//        )
//      ),
//     );
//   }
// }
//
//
//






import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:planet/screens/description.dart';
import 'package:planet/screens/neptune.dart';

import '../services/networking.dart';



class Planet {
  final String name;
  final String imagePath;
  final String description;
  final String mass;
  final String moons;
  final String rotation_period;
  final String atmosphere;

  Planet({
    required this.name,
    required this.imagePath,
    required this.mass,
    required this.moons,
    required this.rotation_period,
    required this.atmosphere,
    required this.description,
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
      planets_list.add(Planet(name: planet["planet_name"],
          imagePath: "assets/images/${planet["planet_name"]}.png",
          mass: planet["mass"],
          moons: planet["confirmed_moons"],
          rotation_period: planet["rotation_period"],
          atmosphere: planet["atmosphere"],
          description: planet["description"]));
    }
  }

  void buildPlanet(int nav) {
    if (currentPlanetIndex + nav >= 0 && currentPlanetIndex + nav < planets_list.length) {
        currentPlanetIndex += nav;
    } else if (currentPlanetIndex == 0 && nav == -1) {
      Navigator.pop(context);
    } else if (currentPlanetIndex == planets_list.length - 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NeptuneScreen()),
      );
    }
  }

  Widget buildButton(int nav) {
    return Container(
      width: 150,
      height: 150,
      child:InkWell(
      child: Ink.image(image: AssetImage(planets_list[currentPlanetIndex].imagePath)),
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
    currentPlanetIndex = 1;
    getData();

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: SingleChildScrollView(
        child:!isLoading? Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/${planets_list[currentPlanetIndex].name}Screen.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Expanded(
                  child: FloatingActionButton(
                  child: Text("Show Details",textAlign: TextAlign.center,),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Description(planets_list[currentPlanetIndex])));
                  },
                ),
                ), // Previous button
                  const SizedBox(
                    width: 150,
                  ),
                ],
              ),
              const SizedBox(
                height: 550,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildButton(-1), // Previous button
                  const SizedBox(
                    width: 150,
                  ),
                  buildButton(1), // Next button
                ],
              )
            ],
          ),
        ):Center(
          child: SpinKitWave(
            color: Colors.white,
            size: 100.0,
          ),
        ),
      ),
        ),
    );
  }
}