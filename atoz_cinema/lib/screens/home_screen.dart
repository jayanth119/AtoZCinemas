import 'package:atoz_cinema/data/data.dart';
import 'package:atoz_cinema/models/searchmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:atoz_cinema/cubits/cubits.dart';
import 'package:atoz_cinema/widgets/widgets.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:atoz_cinema/models/cinema.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 50.0),
        child: BlocBuilder<AppBarCubit, double>(
          builder: (context, scrollOffset) {
            return CustomAppBar(
              scrollOffset: scrollOffset,
            );
          },
        ),
      ),
      body: Consumer<Flow>(
        builder: (context, flow, child) {
          if (flow.isloading()) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: ContentHeader(featuredContent: sintelContent),
                ),
                SliverToBoxAdapter(
                  child: ContentList(
                    key: const PageStorageKey('Rec Movies'),
                    title: 'Recommended Movies',
                    mongo: flow.booking(),
                    mode: 1,
                  ),
                ),
                SliverToBoxAdapter(
                  child: ContentList(
                    key: const PageStorageKey('originals'),
                    title: 'Top 2024',
                    isOriginals: true,
                    mongo: flow.topMovies(),
                    mode: 0,
                  ),
                ),
                SliverToBoxAdapter(
                  child: ContentList(
                    key: const PageStorageKey('soon'),
                    title: 'Coming Soon ...',
                    mongo: flow.later(),
                    mode: 0,
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }
}

//+++++++++++++++++++++++++++++++++++++++++++++++++provider+++++++++++++++++++++++++++++++++++++++++++=
class Flow extends ChangeNotifier {
  late List<Model> _booking = [];
  late List<Model> _topMovies = [];
  late List<Model> _later = [];
  bool isLoading = true;
  List<SearchModel> _search = [];

  List<Model> booking() {
    return _booking;
  }

  List<SearchModel> search() {
    return _search;
  }

  List<Model> topMovies() {
    return _topMovies;
  }

  List<Model> later() {
    return _later;
  }

  bool isloading() {
    return isLoading;
  }

  Flow() {
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      _booking = await getBookList('http://192.168.1.102:8000/book');
      _topMovies = _booking;
      _later = _booking;
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      notifyListeners();
      if (kDebugMode) {
        print('Error fetching data: $e');
      }
    }
  }

  Future<List<Model>> getBookList(String url) async {
    try {
      Map<String, String> headers = {
        "Content-type": 'application/json',
        "Accept": 'application/json',
        "Connection": "Keep-alive",
      };

      final response = await http.get(Uri.parse(url), headers: headers);
      final List<dynamic> jsonDataList = json.decode(response.body);
      if (kDebugMode) {
        print(jsonDataList);
      }
      final List<Model> models =
          jsonDataList.map((jsonData) => Model.fromJson(jsonData)).toList();
      return models;
    } catch (e) {
      if (kDebugMode) {
        print('Http error: $e');
      }
      throw Exception('Failed to load data: $e');
    }
  }
}
