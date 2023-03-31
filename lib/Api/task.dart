import 'package:api/project/controller/api_controller.dart';
import 'package:flutter/material.dart';

class ColorsPage extends StatelessWidget {
  ColorsPage({super.key});

  ApiIntegration colorApi = ApiIntegration();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Colors')),
      body: FutureBuilder(
        future: colorApi.GetApi(),
        builder: ((
          context,
          AsyncSnapshot snapshot,
        ) {
          return Expanded(
            child: ListView.builder(
                // shrinkWrap: false,
                itemCount: snapshot.data.length,
                itemBuilder: (
                  ctx,
                  index,
                ) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data[index]['product_colors'].length,
                      itemBuilder: (context, ind) {
                        // var colors = snapshot.data["product_colors"]["hex_value"];
                        var colorName = snapshot.data[index]['product_colors']
                            [ind]["colour_name"];

                        Color color = HexColor(snapshot.data[index]
                            ['product_colors'][ind]["hex_value"]);

                        print('$color');

                        return Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: color,
                            border: Border.all(
                              color: Color(0xFF000000),
                              width: 1,
                            ),
                          ),
                          child: Text('$colorName'),
                        );
                      });
                }),
          );
        }),
      ),
    );
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
