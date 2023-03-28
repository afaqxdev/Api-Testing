import 'dart:convert';

import 'package:api/Four_Example/Four_Model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Four_Test extends StatefulWidget {
  const Four_Test({super.key});

  @override
  State<Four_Test> createState() => _Four_TestState();
}

class _Four_TestState extends State<Four_Test> {
  List<four_Model> EmpList = [];
  var data;
  Future<void> getdata() async {
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products'));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Store"),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
            future: getdata(),
            builder: (context, snapshot) {
              return ListView.builder(
                  itemCount: data['products'].length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(
                        children: [
                          Text(
                              'Discription:\t\t${data['products'][index]['description'].toString()}'),
                          Text(
                              'name:\t\t${data['products'][index]['title'].toString()}'),
                        ],
                      ),
                    );
                  });
            },
          ))
        ],
      ),
    );
  }
}
