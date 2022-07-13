import 'package:flutter/material.dart';
import 'package:movieapp/widgets/movie_details/movie_details_model.dart';
import 'package:provider/provider.dart';

class MovieDetailsFloatingButtonWidget extends StatefulWidget {
  const MovieDetailsFloatingButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<MovieDetailsFloatingButtonWidget> createState() =>
      _MovieDetailsFloatingButtonWidgetState();
}

class _MovieDetailsFloatingButtonWidgetState
    extends State<MovieDetailsFloatingButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final model = context.watch<MovieDetailsModel>();
    final favoriteData =
        context.select((MovieDetailsModel model) => model.data.favoriteData);
    return FloatingActionButton(
      onPressed: () {
        model.toggleFavorite(context);
      },
      backgroundColor: const Color.fromRGBO(3, 37, 65, 1),
      child: Icon(favoriteData.favoriteIcon),
    );
  }
}
