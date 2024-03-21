import 'dart:convert';

import 'package:atoz_cinema/data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:atoz_cinema/cubits/cubits.dart';
import 'package:atoz_cinema/models/cinema.dart';
import 'package:atoz_cinema/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({required Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;
  late List<Model> booking = [];
  late List<Model> topMovies = [];
  late List<Model> later = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    fetchData();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> fetchData() async {
    try {
      final bookingData = await getBook('http://127.0.0.1:8000/book');
      setState(() {
        booking = [bookingData];
      });
      // Process the booking data as needed...
    } catch (e) {
      print('Error fetching data: $e');
      // Handle the error gracefully...
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text(
              'Failed to fetch data. Please check your internet connection and try again.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  Future<Model> getBook(String url) async {
    try {
      final response =
          await http.get(Uri.parse(url)); // Make GET request using http
      final jsonData = json.decode(response.body); // Decode JSON response
      print(jsonData);
      return Model.fromJson(jsonData);
    } catch (e) {
      print('Http error: $e');
      throw Exception('Failed to load data: $e');
    }
  }

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
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : CustomScrollView(
              controller: _scrollController,
              slivers: [
                const SliverToBoxAdapter(
                  child: ContentHeader(featuredContent: sintelContent),
                ),
                SliverToBoxAdapter(
                  child: ContentList(
                    key: const PageStorageKey('Rec Movies'),
                    title: 'Recommended Movies',
                    mongo: booking,
                  ),
                ),
                SliverToBoxAdapter(
                  child: ContentList(
                    key: const PageStorageKey('originals'),
                    title: 'Top 2024',
                    isOriginals: true,
                    mongo: booking,
                  ),
                ),
                SliverToBoxAdapter(
                  child: ContentList(
                    key: const PageStorageKey('soon'),
                    title: 'Coming Soon ...',
                    mongo: booking,
                  ),
                )
              ],
            ),
    );
  }
}
