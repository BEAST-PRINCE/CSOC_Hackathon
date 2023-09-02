import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:planet/authentication/signin.dart';
import 'package:planet/screens/planets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  Future signin() async {
    var signInStatus = await signInWithGoogle();
    if (signInStatus == FirebaseAuthException) {
      print("Logged in");
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Planets()));
    } else {
      print(signInStatus);
      print("Else");
      Fluttertoast.showToast(
          msg: "Sign-in Failed. Continue as a guest.",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.deepPurpleAccent,
          textColor: Colors.white,
          fontSize: 20.0
      );
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Planets()));

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign up"),
      ),
      backgroundColor: const Color.fromRGBO(38, 24, 81, 1),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [SizedBox(height: 300,),
            FloatingActionButton.extended(
              label: const Text("Login using Google"),
              icon: const Icon(Icons.login_outlined) ,//Icon(CupertinoIcons.lock),
              onPressed: () {
                signin();
              },
            ),
          ],
        ),
      ),
      ),
    );
  }
}
