// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names, avoid_print

import 'dart:io';
import 'package:atoz_cinema/utils/movietile.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class MyGridScreen extends StatefulWidget {
  const MyGridScreen({super.key});

  @override
  State<MyGridScreen> createState() => _MyGridScreenState();
}

class _MyGridScreenState extends State<MyGridScreen> {
  List<Map<String, dynamic>> movieData = [];
  int crossAxisCount = 2;
  double height = 300;
  double width = 250;
  Future<void> ToGet() async {
    var url = Uri.http('127.0.0.1:8000', '/movie');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;

      setState(() {
        movieData = List<Map<String, dynamic>>.from(jsonResponse);
      });

      var itemCount = movieData.length;
      print('Number of items in the list: $itemCount.');
      print(movieData[0]["cast"]);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  void initState() {
    ToGet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Adjust crossAxisCount, height, and width based on the platform
    if (Platform.isWindows) {
      crossAxisCount = 3;
      height = 50;
      width = 50;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter GridView Demo"),
        backgroundColor: Colors.green,
      ),
      body: GridView.builder(
        itemCount: 30,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
        ),
        itemBuilder: (BuildContext context, int index) {
          return MovieTile(
            image: movieData[index]["thumbnail"],
            title: movieData[index]["title"],
            height: height,
            width: width,
          );
        },
      ),
    );
  }
}
