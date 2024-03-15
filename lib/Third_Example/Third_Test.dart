import 'dart:convert';
import 'package:api/Third_Example/Design.dart';
import 'package:api/Third_Example/Third_Model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

class ApiResponse extends StatefulWidget {
  const ApiResponse({Key? key}) : super(key: key);

  @override
  State<ApiResponse> createState() => _ApiResponseState();
}

class _ApiResponseState extends State<ApiResponse> {
  List<BackModel> backList = [];
  Future<List<BackModel>> getBackApi() async {
    var uri =
        Uri.https('exercisedb.p.rapidapi.com', '/exercises/bodyPart/back');

    print(uri.toString());

    final response = await http.get(uri, headers: {
      'X-RapidAPI-Key': '02b54f84a5mshce7e918685fa1d0p1625d3jsn19f9526449eb',
      'X-RapidAPI-Host': 'exercisedb.p.rapidapi.com'
    });

    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      for (Map i in data) {
        backList.add(BackModel.fromJson(i));
      }
      return backList;
    } else {
      return backList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Api Practice')),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
            future: getBackApi(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: Text("Loading...."),
                );
              } else {
                return ListView.builder(
                    itemCount: backList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          InkWell(
                              onTap: () {
                                Get.to(Design_Back(
                                  image: backList[index].gifUrl.toString(),
                                  Workout: backList[index].name!.toUpperCase(),
                                  target: backList[index].target!.toUpperCase(),
                                  equip:
                                      backList[index].equipment!.toUpperCase(),
                                ));
                                QuickAlert.show(
                                  context: context,
                                  type: QuickAlertType.loading,
                                  autoCloseDuration: const Duration(seconds: 2),
                                  title: 'Loading',
                                  text: 'Fetching your data',
                                );
                              },
                              child: Column(
                                children: [
                                  Text(
                                    backList[index].name.toString(),
                                    style: TextStyle(fontSize: 19.sp),
                                  ),
                                ],
                              )),
                        ],
                      );
                    });
              }
            },
          ))
        ],
      ),
    );
  }
}
