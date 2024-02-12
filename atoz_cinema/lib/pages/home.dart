import 'package:atoz_cinema/ad_banner.dart';
import 'package:atoz_cinema/carousel_slider.dart';
import 'package:atoz_cinema/movietile.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final movie = [
    "assets/av1.jpg",
    "assets/av2.jpg",
    "assets/av3.jpg",
    "assets/av1.jpg",
    "assets/av2.jpg",
    "assets/av3.jpg",
    "assets/av1.jpg",
    "assets/av2.jpg",
    "assets/av3.jpg",
    "assets/av1.jpg",
    "assets/av2.jpg",
    "assets/av3.jpg",
    "assets/av1.jpg",
    "assets/av2.jpg",
    "assets/av3.jpg",
    "assets/av1.jpg",
    "assets/av2.jpg",
    "assets/av3.jpg"
  ];
  final name = [
    "avenger",
    "deadpool ",
    "ironman",
    "avenger",
    "deadpool ",
    "ironman",
    "avenger",
    "deadpool ",
    "ironman",
    "avenger",
    "deadpool ",
    "ironman",
    "avenger",
    "deadpool ",
    "ironman",
    "avenger",
    "deadpool ",
    "ironman"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Chip(
                  label: Icon(Icons.video_camera_back_outlined),
                ),
                Chip(
                  label: Icon(Icons.comment),
                ),
                Chip(
                  label: Icon(Icons.flutter_dash),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: double.infinity,
            height: 8,
          ),
          const Carousel_slider(),
          const SizedBox(
            width: double.infinity,
            height: 8,
          ),
          const AddBanner(),
          // SizedBox(
          //   width: double.infinity,
          //   height: 8,
          // ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(10),
              itemCount: movie.length,
              itemBuilder: (BuildContext context, int index) {
                return MovieTile(
                  image: movie[index],
                  title: name[index],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
