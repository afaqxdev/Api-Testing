import 'package:flutter/material.dart';

class Detailpi extends StatelessWidget {
  Detailpi({required this.image, super.key});
  String image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          height: 600,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(image), fit: BoxFit.cover)),
        ),
      ]),
    );
  }
}
