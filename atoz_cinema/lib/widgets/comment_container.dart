import 'package:flutter/material.dart';

class CommentContainer extends StatelessWidget {
  const CommentContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      height: 128,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Category(
            image_location: "assets/images/stranger_things.jpg",
            name: 'Cody Fisher',
            comments:
                "Great movie i will review it more than once Special thanks to the operator!....",
          ),
          const SizedBox(width: 10),
          Category(
            image_location: 'assets/images/stranger_things.jpg',
            name: 'Zendaya',
            comments:
                "Great movie i will review it more than once Special thanks to the operator!....",
          ),
          const SizedBox(width: 10),
          Category(
            image_location: 'assets/images/stranger_things.jpg',
            name: 'Rebecca Ferguson',
            comments:
                "Great movie i will review it more than once Special thanks to the operator!....",
          ),
          const SizedBox(width: 10),
          Category(
            image_location: 'assets/images/stranger_things.jpg',
            name: 'Oscar Isaac',
            comments:
                "Great movie i will review it more than once Special thanks to the operator!....",
          ),
          const SizedBox(width: 10),
          Category(
            image_location: 'assets/images/stranger_things.jpg',
            name: 'Jason Momoa',
            comments:
                "Great movie i will review it more than once Special thanks to the operator!....",
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String name;
  final String comments;

  Category({
    required this.image_location,
    required this.name,
    required this.comments,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Container(
          padding: const EdgeInsets.all(8),
          height: 128,
          width: 290,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(image_location),
                    radius: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          "june 14, 2021",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    "5.0",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Icon(
                    Icons.star,
                    color: Colors.orange.shade200,
                  )
                ],
              ),
              const SizedBox(height: 10),
              Text(
                comments,
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
