// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:flutter/material.dart';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class Backend extends ChangeNotifier {
  List<Map<String, dynamic>> movieData = [];
  Future<void> ToGet() async {
    var url = Uri.http('127.0.0.1:8000', '/movie');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;
      movieData = List<Map<String, dynamic>>.from(jsonResponse);
      notifyListeners();
      var itemCount = movieData.length;
      print('Number of items in the list: $itemCount.');
      print(movieData[0]["cast"]);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
