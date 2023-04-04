import 'dart:convert';

import 'package:api/project/Shoes/Model.dart';
import 'package:api/project/Login_Api/Login_api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ShoesApi extends StatefulWidget {
  const ShoesApi({super.key});

  @override
  State<ShoesApi> createState() => _ShoesApiState();
}

class _ShoesApiState extends State<ShoesApi> {
  List<ShoesModel> Emptylist = [];
  Future<List<ShoesModel>> TargetApi() async {
    var uri = Uri.https('shoes-collections.p.rapidapi.com', '/gshoes');
    final response = await http.get(uri, headers: {
      'X-RapidAPI-Key': '02b54f84a5mshce7e918685fa1d0p1625d3jsn19f9526449eb',
      'X-RapidAPI-Host': 'shoes-collections.p.rapidapi.com'
    });
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print('this is response:${response.statusCode}');
      for (Map i in data) {
        Emptylist.add(ShoesModel.fromJson(i));
      }
      return Emptylist;
    } else {
      return Emptylist;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Api"),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
            future: TargetApi(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: Text("loading..."));
              } else {
                return ListView.builder(
                  itemCount: Emptylist.length,
                  itemBuilder: (context, index) {
                    return Card(child: Text(index.toString()));
                  },
                );
              }
            },
          ))
        ],
      ),
    );
  }
}
