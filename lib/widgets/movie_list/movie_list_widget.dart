import 'package:flutter/material.dart';
import 'package:movieapp/widgets/main_screen/main_screen_view_model.dart';
import 'package:movieapp/widgets/movie_list/movie_popiular_widget.dart';
import 'package:movieapp/widgets/movie_list/movie_rated_widget.dart';
import 'package:provider/provider.dart';


class TabBarViewMovieWidget extends StatefulWidget {
  const TabBarViewMovieWidget({Key? key}) : super(key: key);

  @override
  State<TabBarViewMovieWidget> createState() => _TabBarViewMovieWidgetState();
}

class _TabBarViewMovieWidgetState extends State<TabBarViewMovieWidget> {
  @override
  Widget build(BuildContext context) {
    final model = context.read<MainScreenViewModel>();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.black38,
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              pinned: true,
              floating: true,
              snap: true,
              title: const Text(
                'MovieApp',
                textAlign: TextAlign.start,
              ),
              actions: [
                IconButton(
                    onPressed: () => model.logoutAccount(context),
                    icon: const Icon(Icons.logout)),
              ],
              bottom: const TabBar(
                indicatorColor: Colors.white,
                tabs: [
                  Tab(text: 'Popular'),
                  Tab(text: 'Rated'),
                ],
              ),
            )
          ],
          body: const Expanded(
            child: TabBarView(
              children: [
                MoviePopularWidget(),
                MovieRatedWidget(),
              ],
            ),
          ),
        )
      ),
    );
  }
}