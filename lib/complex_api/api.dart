import 'dart:convert';

import 'package:api/project/Model/news_api.dart';
import 'package:api/project/complex_api/model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class complex_api extends StatefulWidget {
  const complex_api({super.key});

  @override
  State<complex_api> createState() => _complex_apiState();
}

class _complex_apiState extends State<complex_api> {
  List<compex> getlist = [];
  Future<List<compex>> getpostApi() async {
    final response = await http
        .get(Uri.parse("https://fakestoreapi.com/products?sort=desc"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        print(i["title"]);
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
              builder: (context, AsyncSnapshot<List<compex>> snapshot) {
                if (snapshot.hasData) {
                  return Center(child: Text("Loading..."));
                } else {
                  return ListView.builder(
                      itemCount: getlist.length,
                      itemBuilder: (context, index) {
                        return Card(
                            child: Column(
                          children: [
                            Text(snapshot.data![index].id.toString()),
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
