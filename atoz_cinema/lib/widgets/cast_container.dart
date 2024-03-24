import 'package:atoz_cinema/models/cinema.dart';
import 'package:flutter/material.dart';

class CastContainer extends StatelessWidget {
  final List<Cast>? cast;

  const CastContainer({Key? key, required this.cast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 145,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: cast!.map((e) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Category(
              image_location: e.imageUrl ?? "",
              image_caption: e.name ?? "Name",
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

  const Category({
    Key? key,
    required this.image_location,
    required this.image_caption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Container(
          width: 115,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: image_location.isNotEmpty
                      ? DecorationImage(
                          image: NetworkImage(image_location),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: image_location.isEmpty
                    ? Center(
                        child: Icon(
                          Icons.person,
                          size: 50,
                          color: Colors.white,
                        ),
                      )
                    : null,
              ),
              const SizedBox(height: 2),
              SizedBox(
                width: 100, // Adjusted width to fit the image
                child: Text(
                  image_caption,
                  textAlign: TextAlign.center,
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
