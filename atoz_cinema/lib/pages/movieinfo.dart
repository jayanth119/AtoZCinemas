import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MovieDetail extends StatelessWidget {
  MovieDetail({super.key});
  List<String> cast = ["Glenn Close", "Gérard Depardieu", "Alice Evans"];
  List<String> genres = ["Comedy", "Family", "Crime"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: const Image(
          image: AssetImage('assets/bg.jpg'),
          fit: BoxFit.cover,
        ),
        backgroundColor: Colors.transparent,
        title: const Text("Movie Name "),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Image.asset(
              "assets/av1.jpg",
              width: 200,
              height: 200,
            ),
            const Text(
              "Description",
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const Text(
              "102 Dalmatians is a 2000 American crime comedy film directed by Kevin Lima and produced by Edward S. Feldman and Walt Disney Pictures. The sequel to the 1996 film 101 Dalmatians, a live-action remake of the 1961 Disney animated film of the same name, it stars Glenn Close reprising her role as Cruella de Vil as she attempts to steal puppies for her \"grandest\" fur coat yet. Glenn Close and Tim McInnerny were the only two actors from the 1996 film to return for the sequel. The film received generally negative reviews from critics and was unable to achieve the box office success of its predecessor, although the film was nominated for the Academy Award for Best Costume Design.",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              width: 10,
              height: 10,
            ),
            Row(
              children: [
                const Text(
                  "Geners",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  width: 10,
                  height: 10,
                ),
                Chip(
                  padding: const EdgeInsets.all(15),
                  backgroundColor: Colors.redAccent,
                  autofocus: true,
                  label: Text(
                    genres.toString(),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 30,
              height: 30,
            ),
            Row(
              children: [
                const Text(
                  "Cast",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  width: 10,
                  height: 10,
                ),
                Chip(
                  padding: const EdgeInsets.all(15),
                  backgroundColor: Colors.redAccent,
                  autofocus: true,
                  label: Text(
                    cast.toString(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
