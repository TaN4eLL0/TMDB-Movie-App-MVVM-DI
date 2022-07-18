import 'package:flutter/material.dart';
import 'package:movieapp/widgets/movie_home/movie_home_actor_widget.dart';
import 'package:movieapp/widgets/movie_home/movie_home_header_widget.dart';
import 'package:movieapp/widgets/movie_home/movie_home_upcoming_widget.dart';
import 'movie_home_description_widget.dart';

class MovieHomeWidget extends StatefulWidget {
  const MovieHomeWidget({Key? key}) : super(key: key);

  @override
  State<MovieHomeWidget> createState() => _MovieHomeWidgetState();
}

class _MovieHomeWidgetState extends State<MovieHomeWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            const MovieHomeHeaderWidget(),
            Container(width: double.infinity, height: 10, color: Colors.white10,),
            const MovieHomeUpcomingWidget(),
            // Container(width: double.infinity, height: 10, color: Colors.white10,),

            const MovieHomeActorWidget(),
            Container(width: double.infinity, height: 10, color: Colors.white10,),

            MovieHomeDescriptionWidget(),
          ],
        )
      ],
    );
  }
}
