// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class Carousel_slider extends StatefulWidget {
  const Carousel_slider({super.key});

  @override
  State<Carousel_slider> createState() => _Carousel_sliderState();
}

class _Carousel_sliderState extends State<Carousel_slider> {
  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      width: double.infinity,
      height: 200,
      initialPage: 0,
      indicatorColor: Colors.blue,
      indicatorBackgroundColor: Colors.grey,
      // onPageChanged: (value) {
      //   // ignore: avoid_print
      //   print('Page changed: $value');
      // },
      autoPlayInterval: 3000,
      isLoop: true,
      children: [
        Image.asset(
          'assets/image1.jpg',
          fit: BoxFit.cover,
        ),
        Image.asset(
          'assets/image2.jpg',
          fit: BoxFit.cover,
        ),
        Image.asset(
          'assets/image3.jpg',
          fit: BoxFit.cover,
        ),
        Image.asset(
          'assets/image4.jpg',
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
