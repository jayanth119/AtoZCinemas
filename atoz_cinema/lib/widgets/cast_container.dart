import 'package:atoz_cinema/models/cinema.dart';
import 'package:flutter/material.dart';

class CastContainer extends StatelessWidget {
  final List<Cast>? cast;

  const CastContainer({super.key, required this.cast});
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      height: 145,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: cast!.map((e) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Category(
              image_location: e.name ?? "Name",
              image_caption: e.imageUrl ??
                  "https://m.media-amazon.com/images/M/MV5BYTU0Njc0OGEtM2IwYy00ODE2LWE4MTgtNDZkZjgzMzRhOWY2XkEyXkFqcGdeQXVyMjkxNzQ1NDI@._V1_QL75_UX140_CR0,11,140,140_.jpg",
            ),
          );
        }).toList(),
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
