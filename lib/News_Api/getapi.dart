import 'dart:convert';

import 'package:api/project/Model/news_api.dart';
import 'package:api/project/complex_api/model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class model extends StatefulWidget {
  const model({super.key});

  @override
  State<model> createState() => _modelState();
}

class _modelState extends State<model> {
  List<compex> getlist = [];
  Future<List<compex>> getpostApi() async {
    final response =
        await http.get(Uri.parse("https://fakestoreapi.com/products"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        getlist.add(compex.fromJson(i));
      }
      return getlist;
    } else {
      return getlist;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
          child: FutureBuilder(
              future: getpostApi(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text("Loading");
                } else {
                  return ListView.builder(
                      itemCount: getlist.length,
                      itemBuilder: (context, index) {
                        return Card(
                            child: Column(
                          children: [
                            Text(getlist[index].description.toString()),
                            Text(getlist[index].category.toString())
                          ],
                        ));
                      });
                }
              }),
        )
      ]),
    );
  }
}
