// import 'package:atoz_cinema/screens/booking_screen.dart';

import 'package:flutter/material.dart';
import 'package:atoz_cinema/models/searchmodel.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<SearchModel> moviesList = [
    SearchModel("salar", 2023, 8.0),
    SearchModel("dasara", 2023, 8.0),
    SearchModel("gammi", 2023, 8.0),
  ];

  List<SearchModel> filteredMoviesList = [];

  @override
  void initState() {
    filteredMoviesList = List.from(moviesList);
    super.initState();
  }

  void search(String val) {
    setState(() {
      filteredMoviesList = moviesList
          .where((element) =>
              element.name!.toLowerCase().contains(val.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Search Movie',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                onChanged: (value) => search(value),
                style: const TextStyle(
                  color: Colors.red,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.black,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Enter Movie name',
                  hintStyle: const TextStyle(color: Colors.red),
                  prefixIcon: const Icon(Icons.search, color: Colors.red),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Expanded(
                child: filteredMoviesList.isEmpty
                    ? const Center(
                        child: Text(
                          'Item not found',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemCount: filteredMoviesList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () => {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => const BookingScreen(
                              //       image_location:
                              //           'assets/images/stranger_things.jpg',
                              //       image_caption: 'stranger_things',
                              //       mode: 0, mongo: null,
                              //     ),
                              //   ),
                              // )
                            },
                            child: ListTile(
                              contentPadding: const EdgeInsets.all(8.0),
                              title: Text(
                                filteredMoviesList[index].name!,
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                filteredMoviesList[index].year.toString(),
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              trailing: Text(
                                filteredMoviesList[index].rating.toString(),
                                style: const TextStyle(
                                  color: Colors.yellowAccent,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
