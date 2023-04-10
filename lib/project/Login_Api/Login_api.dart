import 'package:api/project/controller/api_controller.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  Login({super.key});
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  ApiIntegration api = ApiIntegration();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Login Api"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: email,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: password,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            MaterialButton(
              onPressed: () {
                print("yesssssssssssssssssssss!");
                api.Login_api(email: email.text, password: password.text);
              },
              child: Text("Button"),
            )
          ],
        ),
      ),
    ));
  }
}

TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();
