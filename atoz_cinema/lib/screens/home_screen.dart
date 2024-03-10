import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:atoz_cinema/cubits/cubits.dart';
import 'package:atoz_cinema/data/data.dart';
import 'package:atoz_cinema/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({required Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        context.read<AppBarCubit>().setOffset(_scrollController.offset);
      });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
      body: CustomScrollView(
        controller: _scrollController,
        slivers: const [
          SliverToBoxAdapter(
            child: ContentHeader(featuredContent: sintelContent),
          ),
          // SliverPadding(
          //   padding: EdgeInsets.only(top: 20.0),
          //   sliver: SliverToBoxAdapter(
          //     child: Previews(
          //       key: PageStorageKey('previews'),
          //       title: 'Previews',
          //       contentList: previews,
          //     ),
          //   ),
          // ),
          SliverToBoxAdapter(
            child: ContentList(
              key: PageStorageKey('Rec atoz_cinemas'),
              title: 'Recommended atoz_cinemas ',
              contentList: myList, // this cinemas can be booked
            ),
          ),
          SliverToBoxAdapter(
            child: ContentList(
              key: PageStorageKey('originals'), //top movies
              title: 'Top 2024',
              contentList: originals,
              isOriginals: true,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(bottom: 20.0),
            sliver: SliverToBoxAdapter(
              child: ContentList(
                key: PageStorageKey('soon'), //future release movies
                title: 'Comming Soon ...',
                contentList: trending,
              ),
            ),
          )
        ],
      ),
    );
  }
}
