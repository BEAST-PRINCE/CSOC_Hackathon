import 'package:flutter/material.dart';

class Description extends StatefulWidget {
  var description;
  Description(this.description);

  @override
  DescriptionState createState() => DescriptionState();
}

class DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(child:Column(
        children: [Text(""),]
        ),
        ),
      );
  }
}
