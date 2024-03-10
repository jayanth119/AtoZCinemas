import 'package:flutter/material.dart';

class CastContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      height: 145,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Category(
            image_location: "assets/images/stranger_things.jpg",
            image_caption: 'Timothée Chalamet',
          ),
          const SizedBox(width: 8),
          Category(
            image_location: 'assets/images/stranger_things.jpg',
            image_caption: 'Zendaya',
          ),
          const SizedBox(width: 8),
          Category(
            image_location: 'assets/images/stranger_things.jpg',
            image_caption: 'Rebecca Ferguson',
          ),
          const SizedBox(width: 8),
          Category(
            image_location: 'assets/images/stranger_things.jpg',
            image_caption: 'Oscar Isaac',
          ),
          const SizedBox(width: 8),
          Category(
            image_location: 'assets/images/stranger_things.jpg',
            image_caption: 'Jason Momoa',
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;

  Category({
    required this.image_location,
    required this.image_caption,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Container(
          width: 115,
          // color: Colors.cyanAccent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  // color: Colors.yellow,
                  image: DecorationImage(
                    image: AssetImage(image_location),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 2),
              SizedBox(
                width: 70,
                child: Text(
                  textAlign: TextAlign.center,
                  image_caption,
                  style: const TextStyle(
                    color: Colors.white54,
                    fontFamily: 'Tenor Sans',
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
