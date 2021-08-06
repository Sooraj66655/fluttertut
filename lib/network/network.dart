import 'dart:convert';

import 'package:http/http.dart';

class Network {
  final String url;
  Network(this.url);

  Future fetchData() async {
    //print("$url");
    Response response = await get(Uri.parse(url));

    if (response.statusCode == 200) {
      // print(response.body);
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}
