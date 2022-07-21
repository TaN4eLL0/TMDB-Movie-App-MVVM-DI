import 'package:flutter/material.dart';
import 'package:movieapp/widgets/movie_list/movie_popiular_widget.dart';
import 'package:movieapp/widgets/movie_list/movie_rated_widget.dart';

class TabBarViewMovieWidget extends StatefulWidget {
  const TabBarViewMovieWidget({Key? key}) : super(key: key);

  @override
  State<TabBarViewMovieWidget> createState() => _TabBarViewMovieWidgetState();
}

class _TabBarViewMovieWidgetState extends State<TabBarViewMovieWidget> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.black38,
        body: Column(
          children: const [
            TabBar(
              tabs: [
                Tab(text: 'Popular'),
                Tab(text: 'Rated'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  MoviePopularWidget(),
                  MovieRatedWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


