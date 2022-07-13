import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movieapp/domain/entity/movie_favorite.dart';
import 'package:movieapp/domain/entity/movie_favorite_response.dart';
import 'package:movieapp/navigation/main_navigation_route_names.dart';

abstract class MovieFavoriteViewModelLoadFavoriteMovie {
  Future<MovieFavoriteResponse> loadFavoriteMovie();
}

class MovieFavoriteViewModel extends ChangeNotifier {
  final MovieFavoriteViewModelLoadFavoriteMovie loadFavoriteMovie;
  final movies = <MovieFavorite>[];
  final _dateFormat = DateFormat.yMMMMd();

  MovieFavoriteViewModel({required this.loadFavoriteMovie});

  String stringFromDate(DateTime? date) =>
      date != null ? _dateFormat.format(date) : '';

  Future<void> loadMoviesFavorite() async {
    final moviesResponse = await loadFavoriteMovie.loadFavoriteMovie();
    movies.addAll(moviesResponse.movies);
    notifyListeners();
  }
  void favoriteOnMovieTap(BuildContext context, int index) {
    final id = movies[index].id;
    Navigator.of(context).pushNamed(
      MainNavigationRouteNames.movieDetails,
      arguments: id,
    );
  }
}

