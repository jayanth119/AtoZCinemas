import 'package:flutter/material.dart';

class CommentContainer extends StatelessWidget {
  final List<Map<String, String>> comments;

  const CommentContainer({Key? key, required this.comments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 128,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: comments.length,
        itemBuilder: (BuildContext context, int index) {
          final comment = comments[index];
          return Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Category(
              name: comment['name'] ?? '',
              comments: comment['review'] ?? '',
              date: '',
              rate: comment["rating"] ?? '',
            ),
          );
        },
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String name;
  final String comments;
  final String date;
  final String rate;

  const Category({
    required this.name,
    required this.comments,
    required this.date,
    required this.rate,
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
                  const CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/stranger_things.jpg'),
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
                        Text(
                          date,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Text(
                    rate,
                    style: const TextStyle(
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
