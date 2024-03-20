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
      final bookingData =
          await getBook(Uri.parse('http://127.0.0.1:8000/book'));

      // final topMoviesData =
      //     await getBook(Uri.parse('http://127.0.0.1:8000/top'));
      // final laterData = await getBook(Uri.parse('http://127.0.0.1:8000/soon'));

      setState(() {
        booking = [bookingData];
        // topMovies = [topMoviesData];
        // later = [laterData];
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching data: $e');
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Failed to fetch data. Please try again later.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  isLoading = false;
                });
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  Future<Model> getBook(Uri url) async {
    final response = await http.get(url);

    final jsonData = jsonDecode(response.body);
    print(jsonData);
    return Model.fromJson(jsonData);
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
