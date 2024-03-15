import 'package:countdown_progress_indicator/countdown_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:shifting_tabbar/shifting_tabbar.dart';

class Design_Back extends StatelessWidget {
  Design_Back({this.equip, this.image, this.Workout, this.target, super.key});
  final String? image;
  final String? target;
  final String? Workout;
  final String? equip;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(231, 6, 15, 53),
      appBar: ShiftingTabBar(
        tabs: [
          ShiftingTab(
            icon: Icon(Icons.directions_bike),
            text: "Test 1",
          ),
          ShiftingTab(icon: Icon(Icons.directions_car), text: "Test 2"),
          ShiftingTab(icon: Icon(Icons.directions_transit), text: "Test 3"),
        ],
      ),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 20)),
          Container(
              height: 450,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.red, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                // image: DecorationImage(
                //   colorFilter: new ColorFilter.mode(
                //       Colors.transparent.withOpacity(0.7), BlendMode.dstATop),
                // image: NetworkImage(image!),
                // fit: BoxFit.fill,
              )
              // ),
              ),
          Padding(padding: EdgeInsets.only(top: 15)),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: Text(
              "Training Detail ",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    height: 180,
                    width: 160,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: Colors.red, width: 2),
                        borderRadius: BorderRadius.circular(18)),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.all(15),
                          child: Text(
                            "Target",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            "target",
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                    height: 180,
                    width: 160,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.red, width: 2),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(18)),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.all(15),
                          child: Text(
                            "Timer",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: CountDownProgressIndicator(
                            valueColor: Colors.red,
                            backgroundColor: Colors.blue,
                            initialPosition: 0,
                            duration: 20,
                            text: 'SEC',
                            timeTextStyle:
                                TextStyle(color: Colors.white, fontSize: 22),
                            onComplete: () => null,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                    height: 180,
                    width: 160,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.red, width: 2),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(18)),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.all(15),
                          child: Text(
                            "Equipment",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            "equip",
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
