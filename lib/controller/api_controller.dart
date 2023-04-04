import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Model/news_api.dart';

class ApiIntegration {
  GetApi() async {
    String url = "https://makeup-api.herokuapp.com/api/v1/products.json";

    final all_data = Uri.parse(url);
    final response = await http.get(all_data);
    final bodys = response.body;

    print('my api ststus ${response.statusCode}');
    print('my api data $bodys');
    return json.decode(bodys);
  }

  Gettask() async {
    String url = "http://bonanza.app.ibstel.com/cat1/home/glhome.txt";

    final all_data = Uri.parse(url);
    final response = await http.get(all_data);
    final bodys = response.body;

    print('my api ststus ${response.statusCode}');
    print('my api data $bodys');
    return json.decode(bodys);
  }

  NewsApi() async {
    String url =
        "https://newsapi.org/v2/everything?q=apple&from=2022-09-26&to=2022-09-26&sortBy=popularity&apiKey=9fd4b36bdef34b9c874e322ec6c032c8";
    final all_data = Uri.parse(url);
    final response = await http.get(all_data);
    final body = response.body;
    print("my api status ${response.statusCode}");
    print("my api data $body");
    return json.decode(body);
  }

  Login_api({String? email, String? password}) async {
    String url = "https://fakestoreapi.com/auth/login";

    final all_data = Uri.parse(url);
    Map body_data = {
      "username": email,
      "password": password,
    };
    var last_body = json.encode(body_data);
    final response = await http.post(
      all_data,
      body: last_body,
    );
    print("this is response ${response.statusCode}");
    print("this is response${response.body}");
    return json.decode(response.body);
  }
}
