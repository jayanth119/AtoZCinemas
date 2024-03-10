// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'package:atoz_cinema/models/models.dart';

class ContentHeader extends StatelessWidget {
  final Content featuredContent;

  const ContentHeader({
    required this.featuredContent,
  });

  @override
  Widget build(BuildContext context) {
    return _ContentHeaderMobile(featuredContent: featuredContent);
  }
}

class _ContentHeaderMobile extends StatelessWidget {
  final Content featuredContent;

  const _ContentHeaderMobile({
    required this.featuredContent,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 500.0,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/tiger_king.jpg"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          height: 500.0,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        Positioned(
          bottom: 110.0,
          child: SizedBox(
            width: 250.0,
            child: Image.asset(featuredContent.titleImageUrl),
          ),
        ),
      ],
    );
  }
}
