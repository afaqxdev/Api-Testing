import 'dart:convert';

import 'package:api/First_Example/First_Model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class first_test extends StatefulWidget {
  const first_test({super.key});

  @override
  State<first_test> createState() => _first_testState();
}

class _first_testState extends State<first_test> {
  Future<FirstModel> Firstmodel() async {
    final response = await http
        .get(Uri.parse("https://api.coindesk.com/v1/bpi/currentprice.json"));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      print(response.statusCode);

      return FirstModel.fromJson(data);
    } else {
      return FirstModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Testing")),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
                child: FutureBuilder<FirstModel>(
              future: Firstmodel(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                      child: Text(
                    "Loading...",
                    style: TextStyle(fontSize: 24),
                  ));
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Eur",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      customRow(
                          name:
                              "Discription :\t\t${snapshot.data!.bpi!.eUR!.description!.toString()}"),
                      customRow(
                          name:
                              "code :\t\t ${snapshot.data!.bpi!.eUR!.code!.toString()}"),
                      customRow(
                          name:
                              "RateFloat :\t\t ${snapshot.data!.bpi!.eUR!.rateFloat.toString()}"),
                      customRow(
                          name:
                              "Rate :\t\t ${snapshot.data!.bpi!.eUR!.rate.toString()}"),
                      Text("Time",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      customRow(
                          name:
                              "updatedISO :\t\t${snapshot.data!.time!.updatedISO.toString()}"),
                      customRow(
                          name:
                              "Update :\t\t ${snapshot.data!.time!.updated.toString()}"),
                      customRow(
                          name:
                              "updateduk :\t\t ${snapshot.data!.time!.updateduk.toString()}"),
                      Text("GBP",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      customRow(
                          name:
                              "Discription :\t\t${snapshot.data!.bpi!.gBP!.description!.toString()}"),
                      customRow(
                          name:
                              "code :\t\t ${snapshot.data!.bpi!.gBP!.code!.toString()}"),
                      customRow(
                          name:
                              "RateFloat :\t\t ${snapshot.data!.bpi!.gBP!.rateFloat.toString()}"),
                      customRow(
                          name:
                              "Rate :\t\t ${snapshot.data!.bpi!.gBP!.rate.toString()}"),
                      Text("USD",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      customRow(
                          name:
                              "Discription :\t\t${snapshot.data!.bpi!.uSD!.description!.toString()}"),
                      customRow(
                          name:
                              "code :\t\t ${snapshot.data!.bpi!.uSD!.code!.toString()}"),
                      customRow(
                          name:
                              "RateFloat :\t\t ${snapshot.data!.bpi!.uSD!.rateFloat.toString()}"),
                      customRow(
                          name:
                              "Rate :\t\t ${snapshot.data!.bpi!.uSD!.rate.toString()}"),
                    ],
                  );
                }
              },
            )),
          ],
        ),
      ),
    );
  }
}

class customRow extends StatelessWidget {
  customRow({required this.name, super.key});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          name,
          style: TextStyle(fontSize: 19),
        ),
      ],
    );
  }
}
