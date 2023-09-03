import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:planet/screens/planets.dart';
import '../services/networking.dart';



class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void initState(){
    super.initState();

  }

//   Future<dynamic> getData() async {
//     var uri = Uri.parse('https://csoc-a3-api-2.onrender.com/planetdetails');
//     NetworkHelper networkHelper = NetworkHelper(uri);
//
//     var planet_data = await networkHelper.getData();
//     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){return Planets(planetData: planet_data);}));
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
