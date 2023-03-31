import 'package:api/project/controller/api_controller.dart';
import 'package:api/project/Api/detail_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class first_api extends StatelessWidget {
  first_api({super.key});
  ApiIntegration api = ApiIntegration();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: api.GetApi(),
        builder: (context, AsyncSnapshot sanpshot) {
          if (sanpshot.hasData) {
            return ListView.builder(
              itemCount: sanpshot.data.length,
              itemBuilder: (context, index) {
                var all_data = sanpshot.data[index];
                return InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return Detailpi(image: all_data["image_link"]);
                    }));
                  },
                  child: ListTile(
                    leading: Image.network(
                      all_data["image_link"],
                      height: 80,
                      width: 80,
                    ),
                    title: Text(all_data["name"] ?? "no data"),
                    subtitle:
                        Text("Price \$ ${all_data["Price"] ?? "no Data"}"),
                    trailing: Text(all_data["category"] ?? "no data"),
                  ),
                );
              },
            );
          } else if (sanpshot.hasError) {
            return Text("no data");
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
