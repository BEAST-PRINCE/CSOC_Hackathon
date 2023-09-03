import 'package:flutter/material.dart';

class NeptuneScreen extends StatelessWidget {
  const NeptuneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/Neptune.png"), fit: BoxFit.fill),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [const SizedBox(height: 50,),
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
                    const SizedBox(
                      width: 150,
                    ),
                    InkWell(
                      child: Ink.image(
                        image: const AssetImage("assets/images/Uranus.png"),),
                      onTap: () {
                        Navigator.pop(context, "");
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 550,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 150,
                    ),
                  ],
                )
              ],
            ),
          )
      ),
    );
  }
}
