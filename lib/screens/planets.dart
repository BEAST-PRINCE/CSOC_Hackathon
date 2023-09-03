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








import 'package:flutter/material.dart';
import 'package:planet/screens/neptune.dart';
import 'package:planet/services/networking.dart';


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
  const Planets({Key? key}) : super(key: key);

  @override
  State<Planets> createState() => _PlanetsState();
}

class _PlanetsState extends State<Planets> {

  late int currentPlanetIndex;
  var planetData;
  

  Future getData() async {
    var uri = Uri.parse('https://csoc-a3-api-2.onrender.com/planetdetails');
    NetworkHelper networkHelper = NetworkHelper(uri);

    var planet_data = await networkHelper.getData();
    return planet_data;
  }

  final List<Planet> planets_list = [];

  void addPlanet() {
    for (int i = 1; i <= 10; i++) {
      planets_list.add(Planet(name: planetData[i]["planet_name"],
          imagePath: "assets/images/${planetData[i]["planet_name"]}.png",
          mass: planetData[i]["mass"],
          moons: planetData[i]["confirmed_moons"],
          rotation_period: planetData[i]["rotation_period"],
          atmosphere: planetData[i]["atmosphere"],
          description: planetData[i]["description"]));
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
    return InkWell(
      child: Image.asset(planets_list[currentPlanetIndex].imagePath),
      onTap: () {
        setState(() {
          buildPlanet(nav);
        });
      },
    );
  }

  Future<void> initializePlanets() async{
    planetData = await getData();
    addPlanet();
  }

  @override
  void initState() {
    super.initState();
    currentPlanetIndex = 1;
    initializePlanets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                children: [
                  buildButton(-1), // Previous button
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
        ),
      ),
    );
  }
}