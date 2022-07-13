import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'movie_home_bloc_widget.dart';
import 'movie_home_data_widget.dart';
import 'movie_home_description_widget.dart';
import 'movie_home_series_widget.dart';

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
            MovieHomeBlocWidget(),
            MovieHomeDataWidget(),
            MovieHomeSeriesWidget(),
            MovieHomeDescriptionWidget(),
          ],
        )
      ],
    );
  }
}
