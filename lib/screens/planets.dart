import 'package:flutter/material.dart';
import 'package:planet/screens/neptune.dart';

class Planets extends StatefulWidget {
  const Planets({super.key});

  @override
  State<Planets> createState() => _PlanetsState();
}

class _PlanetsState extends State<Planets> {
  
  var current_planet = "Mercury";
  late int current_planet_number;
  var list_of_planets = ["Sun",
    "Mercury",
    " Venus",
    "Earth",
    "Moon",
    "Jupiter",
    "Saturn",
    "Uranus",
    "Neptune"
  ];
  var previous_planet;
  var next_planet;

  void buildPlanet(int current_planet_num, int nav) {
    if (current_planet_num > 0) {
      current_planet = list_of_planets[0 + nav];
      current_planet_number = current_planet_num + nav;
      previous_planet = list_of_planets[current_planet_number - 1];
    } else if (current_planet_num == 0 && nav == -1) {
      Navigator.pop(context);
    }else if (current_planet_num == 8){
      Navigator.push(context, MaterialPageRoute(builder: (context) => NeptuneScreen()),);
    }
  }

  Widget buildButton(int nav, var planet){
    return InkWell(
      child: Ink.image(image: AssetImage("assets/images/$planet.png"),),
      onTap: (){
        setState(() {
          buildPlanet(current_planet_number, nav);
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    current_planet_number = 1;
    current_planet = list_of_planets[current_planet_number];
    previous_planet = "Sun";
    next_planet = "Venus";
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/"+"$current_planet+Screen"+".png"),
                fit: BoxFit.fill),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildButton(-1, current_planet),
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
              children: [buildButton(-1, previous_planet),
                const SizedBox(
                  width: 150,
                ),
              buildButton(1, next_planet),
            ],
           )
         ],
        ),
       )
     ),
    );
  }
}
