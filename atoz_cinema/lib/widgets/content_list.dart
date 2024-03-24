import 'package:atoz_cinema/models/cinema.dart';
import 'package:flutter/material.dart';
import 'package:atoz_cinema/screens/booking_screen.dart';

class ContentList extends StatelessWidget {
  final int mode;
  final String title;
  final List<Model> mongo;
  final bool isOriginals;

  const ContentList({
    required Key key,
    required this.title,
    this.isOriginals = false,
    required this.mongo,
    required this.mode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {}, // ... your See All button logic
                  child: const Text(
                    "See All > ",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: isOriginals ? 500.0 : 220.0, // Adjust height as needed
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 16.0,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: mongo.length,
              itemBuilder: (BuildContext context, int index) {
                final String con = mongo[index].imageUrl ??
                    "https://m.media-amazon.com/images/M/MV5BN2QyZGU4ZDctOWMzMy00NTc5LThlOGQtODhmNDI1NmY5YzAwXkEyXkFqcGdeQXVyMDM2NDM2MQ@@._V1_UX67_CR0,0,67,98_AL_.jpg";
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookingScreen(
                          mode: mode,
                          mongo: mongo[index],
                          image_caption: '',
                          image_location: '',
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    height:
                        isOriginals ? 400.0 : 200.0, // Adjust height as needed
                    width: isOriginals ? 200.0 : 130.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(con),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
