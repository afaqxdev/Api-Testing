import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class custom_api extends StatefulWidget {
  const custom_api({super.key});

  @override
  State<custom_api> createState() => _custom_apiState();
}

class _custom_apiState extends State<custom_api> {
  List<Api> apilist = [];
  Future<List<Api>> getapi() async {
    final response =
        await http.get(Uri.parse("https://fakestoreapi.com/users?limit=5"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        Api api = Api(Email: i["email"], name: i["username"], phone: i["id"]);
        apilist.add(api);
      }
      return apilist;
    } else {
      return apilist;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Custom API"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getapi(),
                builder: (context, AsyncSnapshot<List<Api>> snapshot) {
                  return ListView.builder(
                      itemCount: apilist.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            leading: CircleAvatar(
                                child: Text(
                                    snapshot.data![index].phone.toString())),
                            title: Text("Name : " +
                                snapshot.data![index].name.toString()),
                            subtitle: Text("Email :" +
                                snapshot.data![index].Email.toString()),
                          ),
                        );
                      });
                }),
          )
        ],
      ),
    );
  }
}

class Api {
  String Email, name;
  int phone;
  Api({required this.Email, required this.name, required this.phone});
}
