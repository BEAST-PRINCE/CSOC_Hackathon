import 'package:flutter/material.dart';

class Description extends StatefulWidget {
  var description;
  Description(this.description,{super.key});

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(child:Column(
        children: [Text(description.name),]
        ),
        ),
      );
  }
}
