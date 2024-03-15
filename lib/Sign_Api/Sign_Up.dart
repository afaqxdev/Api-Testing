import 'dart:developer';

import 'package:api/project/Login_Api/Login_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';

class SignApip extends StatefulWidget {
  const SignApip({super.key});

  @override
  State<SignApip> createState() => _SignApipState();
}

class _SignApipState extends State<SignApip> {
  TextEditingController Email = TextEditingController();
  TextEditingController Password = TextEditingController();

  void Login(String email, paswword) async {
    try {
      Response response = await post(
          Uri.parse('https://reqres.in/api/register'),
          body: {'email': email, 'password': paswword});

      if (response.statusCode == 200) {
        print("succefully login");
      } else {
        print("Faild");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 180.h,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Sign Up",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 50.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 300.w,
                  child: TextField(
                    controller: Email,
                    decoration: InputDecoration(
                        hintText: "Email",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r))),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  width: 300.w,
                  child: TextField(
                    controller: password,
                    decoration: InputDecoration(
                        hintText: "Email",
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r))),
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                SizedBox(
                  width: 250.w,
                  height: 40.h,
                  child: MaterialButton(
                    color: Colors.purple.shade300,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r.r)),
                    onPressed: () {
                      Login(Email.text.toString(), Password.text.toString());
                    },
                    child: Center(
                        child: Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 18.sp),
                    )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
