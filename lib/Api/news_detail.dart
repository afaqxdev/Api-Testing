import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsApiDetails extends StatelessWidget {
  NewsApiDetails(
      {required this.image,
      required this.des,
      required this.title,
      required this.url,
      super.key});

  String image;
  String des;
  String title;
  String url;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(8.0.sp),
          child: Container(
            height: 800,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 250, 230, 233),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    image,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  color: Color.fromARGB(255, 192, 255, 194),
                  child: Text(title, style: GoogleFonts.acme(fontSize: 25)),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                    color: Color.fromARGB(255, 142, 255, 77), child: Text(des)),
                SizedBox(
                  height: 40.0,
                ),
                SelectableText(url),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
