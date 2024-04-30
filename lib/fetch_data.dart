// ignore_for_file: avoid_print

import 'package:fliqlist/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FetchData {
  FetchData(this.titleText);
  String titleText;

  Future fetchList() async {
    http.Response response =
        await http.get(Uri.parse("$baseUrl&s=$titleText&type=movie"));
    if (response.statusCode == 200) {
      var decodedData = await jsonDecode(response.body);
      return decodedData;
    } else {
      print(response.statusCode);
    }
  }

  Future fetchData() async {
    http.Response response =
        await http.get(Uri.parse("$posterAPI&imdb_id=$titleText"));
    if (response.statusCode == 200) {
      var decodedData = await jsonDecode(response.body);
      var movieData = decodedData["data"]["movie"];
      return movieData;
    } else {
      print(response.statusCode);
    }
  }
}
