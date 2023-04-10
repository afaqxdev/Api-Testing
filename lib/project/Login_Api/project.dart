import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/api_controller.dart';

class project extends StatelessWidget {
  project({super.key});

  ApiIntegration task = ApiIntegration();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Center(
            child: Text("IT NEWS"),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: FutureBuilder(
            future: task.Gettask(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                    itemCount: snapshot.data.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0),
                    itemBuilder: (BuildContext context, int index) {
                      var data = snapshot.data[index];
                      return Image.network(
                        "${data["s1"]['m1'] == null ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyFZXxXWbEOZhU2k6hYB_PUFDOCQ8LBdbhLio9-N2iyA&s" : data["urlToImage"]}",
                        fit: BoxFit.fill,
                      );
                    });
              }
              return LinearProgressIndicator(
                color: Colors.amber,
              );
            },
          ),
        ),
      ),
    );
  }
}
