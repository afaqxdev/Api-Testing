import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'Quran/api.dart';

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
            home: QiblahScreen(),
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
