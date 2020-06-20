import 'package:covid19tracker/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class GetData {
  final String url;
  GetData({this.url});

  void fetchData() async {
    var primaryResponse = await http.get(url);
    if (primaryResponse.statusCode == 200) {
      Map<String, dynamic> jsonResponse =
          convert.jsonDecode(primaryResponse.body);
      bloc.addResponse(jsonResponse);
    } else {
      print("Request Unsuccessful");
    }
  }
}
