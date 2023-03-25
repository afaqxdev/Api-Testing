import 'package:api/Four_Example/Api_Integration.dart';
import 'package:api/Second_Example/Second.dart';
import 'package:api/Sign_Api/Sign_Up.dart';
import 'package:api/project/Custom_Api/custom_api.dart';
import 'package:api/FakeShop/UI.dart';
import 'package:api/FakeShop/shop_model.dart';
import 'package:api/First_Example/First.dart';
import 'package:api/project/News_Api/getapi.dart';
import 'package:api/project/Shoes/ApiIntegration.dart';
import 'package:api/Third_Example/Design.dart';
import 'package:api/Third_Example/Third_Test.dart';
import 'package:api/project/complex_api/api.dart';
import 'package:api/project/controller/api_controller.dart';
import 'package:api/project/Login_Api/Login_api.dart';
import 'package:api/project/Login_Api/project.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: ((context, child) => GetMaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            // home: first_api(),
            // home: News(),
            // home: project(),
            home: second_text(),
            // home: second_text(),
            // home: first_test(),
            // home: ApiResponse(),
            // home: Design_Back(),
            // home: Four_Test(),
            // home: SignApip(),
            // home: ShoesApi(),
            //// home: Fake_store(),
            // home: model(),
            // home: custom_api(),
            // home: complex_api(),
            // home: ColorsPage(),
            // home: colour(),
            // home: Login(),
            debugShowCheckedModeBanner: false,
          )),
    );
  }
}
