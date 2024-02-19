// ignore_for_file: non_constant_identifier_names, avoid_print, unused_import

import 'package:atoz_cinema/utils/ad_banner.dart';
import 'package:atoz_cinema/utils/bottomnavbar.dart';
import 'package:atoz_cinema/utils/carousel_slider.dart';
// import 'package:atoz_cinema/utils/movietile.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, dynamic>> movieData = [];

  // Future<void> ToGet() async {
  //   var url = Uri.http('127.0.0.1:8000', '/movie');

  //   var response = await http.get(url);
  //   if (response.statusCode == 200) {
  //     var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;

  //     setState(() {
  //       movieData = List<Map<String, dynamic>>.from(jsonResponse);
  //     });

  //     var itemCount = movieData.length;
  //     print('Number of items in the list: $itemCount.');
  //     print(movieData[0]["cast"]);
  //   } else {
  //     print('Request failed with status: ${response.statusCode}.');
  //   }
  // }

  // @override
  // void initState() {
  //   ToGet();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: const Image(
          image: AssetImage('assets/bg.jpg'),
          fit: BoxFit.cover,
        ),
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: const Text(
          "AtoZ Cinema",
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.qr_code_scanner_rounded),
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: const Column(
          children: [
            // const Padding(
            //   padding: EdgeInsets.all(15),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Chip(
            //         label: Icon(Icons.video_camera_back_outlined),
            //       ),
            //       Chip(
            //         label: Icon(Icons.comment),
            //       ),
            //       Chip(
            //         label: Icon(Icons.flutter_dash),
            //       ),
            //     ],
            //   ),
            // ),
            SizedBox(
              width: double.infinity,
              height: 8,
            ),
            Carousel_slider(),
            SizedBox(
              width: double.infinity,
              height: 8,
            ),
            AddBanner(),
            // Expanded(
            //   child: ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     padding: const EdgeInsets.all(10),
            //     itemCount: 50,
            //     itemBuilder: (BuildContext context, int index) {
            //       return MovieTile(
            //         image: movieData[index]
            //             ["thumbnail"], // Update with your actual field name
            //         title: movieData[index]
            //             ["title"], // Update with your actual field name
            //       );
            //     },
            //   ),
            // )
          ],
        ),
      ),
      bottomNavigationBar: const BelowDisplay(),
    );
  }
}
