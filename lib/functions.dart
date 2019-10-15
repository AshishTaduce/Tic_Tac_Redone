import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'main.dart';

List<List> matrix;
List<List> boxColor;
IconData choice = Icons.clear;
int won = 0;
AnimationController controller;

class Grid extends StatefulWidget {
  @override
  GridState createState() => GridState();
}

class GridState extends State<Grid> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildElement(0, 0),
            buildElement(0, 1),
            buildElement(0, 2),
          ],
        ),
        Row(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildElement(1, 0),
            buildElement(1, 1),
            buildElement(1, 2),
          ],
        ),
        Row(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildElement(2, 0),
            buildElement(2, 1),
            buildElement(2, 2),
          ],
        ),
      ],
    );
  }

  Widget grid =

}
