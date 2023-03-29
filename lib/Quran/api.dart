import 'dart:convert';

import 'package:api/First_Example/First_Model.dart';
import 'package:api/Quran/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Quran extends StatefulWidget {
  const Quran({super.key});

  @override
  State<Quran> createState() => _QuranState();
}

class _QuranState extends State<Quran> {
  Future<ModelQuran> model() async {
    final response = await http
        .get(Uri.parse("http://api.alquran.cloud/v1/quran/quran-uthmani"));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      print(response.statusCode);

      return ModelQuran.fromJson(data);
    } else {
      return ModelQuran.fromJson(data);
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
                child: FutureBuilder<ModelQuran>(
                    future: model(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return ListView.builder(
                          itemCount: snapshot.data?.data?.surahs!.length,
                          itemBuilder: (context, index) {
                            var data = snapshot.data;
                            return Text(data!.code!.toString().toString());
                          },
                        );
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    })),
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
