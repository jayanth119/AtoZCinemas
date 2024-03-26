import 'dart:convert';
import 'package:atoz_cinema/models/searchmodel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

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
                onChanged: (value) {
                  Provider.of<MovieFlow>(context, listen: false)
                      .searchByName(value);
                },
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
                child: Consumer<MovieFlow>(
                  builder: (context, flowProvider, _) {
                    if (flowProvider.search().isEmpty) {
                      return const Center(
                        child: Text(
                          'Item not found',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: flowProvider.search().length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            contentPadding: const EdgeInsets.all(8.0),
                            title: Text(
                              flowProvider.search()[index].title!,
                              style: const TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              flowProvider.search()[index].release.toString(),
                              style: const TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            trailing: Text(
                              flowProvider.search()[index].rating.toString(),
                              style: const TextStyle(
                                color: Colors.yellowAccent,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        },
                      );
                    }
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

class MovieFlow extends ChangeNotifier {
  bool isLoading = true;
  List<SearchModel> _search = [];

  List<SearchModel> search() {
    return _search;
  }

  bool isloading() {
    return isLoading;
  }

  MovieFlow() {
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      isLoading = false;
      _search = await getSearchList("http://localhost:8000/all");
      notifyListeners();
    } catch (e) {
      isLoading = false;
      notifyListeners();
      if (kDebugMode) {
        print('Error fetching data: $e');
      }
      // Handle error gracefully, show message to user or log it
    }
  }

  Future<List<SearchModel>> getSearchList(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      final List<dynamic> jsonDataList = json.decode(response.body);
      if (kDebugMode) {
        print(jsonDataList);
      }
      final List<SearchModel> models = jsonDataList
          .map((jsonData) => SearchModel.fromJson(jsonData))
          .toList();
      return models;
    } catch (e) {
      if (kDebugMode) {
        print('Http error: $e');
      }
      throw Exception('Failed to load data: $e');
    }
  }

  void searchByName(String name) {
    _search = _search
        .where((element) =>
            element.title!.toLowerCase().contains(name.toLowerCase()))
        .toList();
    notifyListeners();
  }
}
