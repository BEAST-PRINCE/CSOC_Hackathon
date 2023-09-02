import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planet/authentication/signin.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  Future signin() async {
    var signInStatus = await signInWithGoogle();
    if (signInStatus == FirebaseAuthException) {
      print("Logged IN");
      // Navigator.pushNamedAndRemoveUntil(BuildContext, "newRouteName", (route) => false);
    } else {
      print(signInStatus);
      print("Else");
      // Navigator.pushNamedAndRemoveUntil(context, "newRouteName", (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign UP"),
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
              label: const Text("LogIn using Google"),
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
