import 'dart:convert';

import 'package:api/Second_Example/Second_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class second_text extends StatefulWidget {
  const second_text({super.key});

  @override
  State<second_text> createState() => _second_textState();
}

class _second_textState extends State<second_text> {
  Future<Second_model> getapi() async {
    final response =
        await http.get(Uri.parse('https://api.publicapis.org/entries'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      print(response.statusCode);
      return Second_model.fromJson(data);
    } else {
      return Second_model.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Testing")),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder<Second_model>(
                  future: getapi(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data!.entries!.length,
                        itemBuilder: (context, index) {
                          return Card(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                  " Http :\t\t${snapshot.data!.entries![index].hTTPS.toString()}"),
                              Text(
                                  'API :\t\t${snapshot.data!.entries![index].aPI.toString()}'),
                              Text(
                                  "Discription :\t\t ${snapshot.data!.entries![index].description.toString()}"),
                              Text(
                                  "Auth  :\t\t ${snapshot.data!.entries![index].auth.toString()}"),
                              Text(
                                  "Category :\t\t ${snapshot.data!.entries![index].category.toString()}"),
                              Text(
                                  "Link  :\t\t ${snapshot.data!.entries![index].link.toString()}"),
                            ],
                          ));
                        },
                      );
                    } else {
                      return Center(
                        child: Text("loading..."),
                      );
                    }
                  })),
        ],
      ),
    );
  }
}
