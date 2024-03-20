import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:atoz_cinema/models/cinema.dart';

class Flow {
  late List<Model> booking = [];
  late List<Model> topMovies = [];
  late List<Model> later = [];
  bool isLoading = true;
  Flow() {
    fetchData();
    if (kDebugMode) {
      print("sucess");
      print(booking[0].rating);
      print(topMovies[0].rating);
      print(later[0].rating);
    }
  }
  Future<void> fetchData() async {
    try {
      final bookingData =
          await getBook(Uri.parse('http://192.168.45.101/book'));

      final topMoviesData =
          await getBook(Uri.parse('http://192.168.45.101/book'));
      final laterData = await getBook(Uri.parse('http://192.168.45.101/book'));

      booking = [bookingData];

      topMovies = [topMoviesData];

      later = [laterData];

      isLoading = false;
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching data: $e');
      }
      // ignore: use_build_context_synchronously
    }
  }

  Future<Model> getBook(Uri url) async {
    final response = await http.get(url);

    final jsonData = jsonDecode(response.body);
    if (kDebugMode) {
      print(jsonData);
    }
    return Model.fromJson(jsonData);
  }
}
