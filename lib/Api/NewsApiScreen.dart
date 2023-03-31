import 'package:api/project/Api/news_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/api_controller.dart';

class News extends StatelessWidget {
  News({super.key});

  ApiIntegration news_api = ApiIntegration();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Center(
            child: Text("IT NEWS"),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: FutureBuilder(
            future: news_api.NewsApi(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                  itemCount: snapshot.data["articles"].length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0),
                  itemBuilder: (BuildContext context, int index) {
                    var data = snapshot.data["articles"][index];
                    return InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return NewsApiDetails(
                              image: data["urlToImage"],
                              des: data["description"],
                              title: data["title"],
                              url: data["url"]);
                        }));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(216, 255, 252, 60),
                            borderRadius: BorderRadius.circular(12.0)),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 7,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(12),
                                  topLeft: Radius.circular(12),
                                ),
                                child: Image.network(
                                  "${data["urlToImage"] == null ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyFZXxXWbEOZhU2k6hYB_PUFDOCQ8LBdbhLio9-N2iyA&s" : data["urlToImage"]}",
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Center(
                                child: Text(
                                  "${data["title"]}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
              return LinearProgressIndicator(
                color: Colors.amber,
              );
            },
          ),
        ),
      ),
    );
  }
}
