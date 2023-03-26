import 'dart:convert';

import 'package:api/FakeShop/shop_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Fake_store extends StatefulWidget {
  const Fake_store({super.key});

  @override
  State<Fake_store> createState() => _Fake_storeState();
}

class _Fake_storeState extends State<Fake_store> {
  List<shope> getlist = [];
  Future<List<shope>> getapi() async {
    final response =
        await http.get(Uri.parse("https://fakestoreapi.com/products"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        getlist.add(shope.fromJson(i));
      }
      return getlist;
    }
    return getlist;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Center(child: Text("Shop")),
        backgroundColor: Colors.orange.shade400,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getapi(),
              builder: (context, AsyncSnapshot<List<shope>> snapshot) {
                if (snapshot.hasData) {
                  return Center(child: Text("loading...."));
                }
                return GridView.builder(
                    itemCount: getlist.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15.0,
                        mainAxisSpacing: 15.0),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            Container(
                              height: 170,
                              child: Image(
                                  image: NetworkImage(
                                      getlist[index].image.toString())),
                            ),
                            Text(
                              'Price: ${getlist[index].price.toString()}',
                              style: TextStyle(fontSize: 20.sp),
                            ),
                          ],
                        ),
                      );
                    });
              },
            ),
          )
        ],
      ),
    );
  }
}
