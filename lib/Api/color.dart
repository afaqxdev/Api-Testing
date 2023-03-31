import 'package:flutter/material.dart';

class colour extends StatefulWidget {
  const colour({super.key});

  @override
  State<colour> createState() => _colourState();
}

class _colourState extends State<colour> {
  int all(String color) {
    String newcolor = '0xff' + color;
    newcolor = newcolor.replaceAll('#', '');
    int finalcolor = int.parse(newcolor);
    return finalcolor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(all('9334eb')),
      ),
    );
  }
}
