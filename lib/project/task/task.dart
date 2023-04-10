import 'dart:convert';

import 'package:api/project/task/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class project extends StatefulWidget {
  const project({super.key});

  @override
  State<project> createState() => _projectState();
}

class _projectState extends State<project> {
  List<task> gettask = [];
  Future<List<task>> taskApi() async {
    final response = await http
        .get(Uri.parse("http://bonanza.app.ibstel.com/cat1/home/glhome.txt"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        gettask.add(task.fromJson(i));
      }
      return gettask;
    } else {
      return gettask;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("api"),
        ),
        body: Column(
          children: [
            FutureBuilder(
                future: taskApi(),
                builder: (context, AsyncSnapshot<List<task>> snapshot) {
                  if (snapshot.hasData) {
                    return Text("Loading");
                  } else {
                    return ListView.builder(
                        itemCount: gettask.length,
                        itemBuilder: (context, index) {
                          return Card(
                              child: Column(
                            children: [
                              Center(
                                child: Image.network(
                                    gettask[index].s1!.m1.toString()),
                              )
                            ],
                          ));
                        });
                  }
                })
          ],
        ));
  }
}
