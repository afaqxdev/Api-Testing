import 'package:flutter/material.dart';

class taask_detail extends StatelessWidget {
  taask_detail({required this.value, super.key});
  String value;
  int all(String color) {
    String newcolor = '0xff' + color;
    newcolor = newcolor.replaceAll('#', '');
    int finalcolor = int.parse(newcolor);
    return finalcolor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          height: 600,
          width: double.infinity,
          decoration: BoxDecoration(
              // color: Color(value(all))

              ),
          child: Text("$value"),
        ),
      ]),
    );
  }
}
