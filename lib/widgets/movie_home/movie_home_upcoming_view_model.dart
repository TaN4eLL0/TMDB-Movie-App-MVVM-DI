import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movieapp/domain/entity/movie_upcoming.dart';
import 'package:movieapp/domain/entity/movie_upcoming_response.dart';
import 'package:movieapp/navigation/main_navigation_route_names.dart';

abstract class MovieUpcomingViewModelLoadUpcoming {
  Future<MovieUpcomingResponse> upcomingMovie();
}

class MovieHomeUpcomingViewModel extends ChangeNotifier {
  final MovieUpcomingViewModelLoadUpcoming loadService;
  final movies = <MovieUpcoming>[];
  final _dateFormat = DateFormat.yMMMMd();

  MovieHomeUpcomingViewModel({required this.loadService});

  String stringFromDate(DateTime? date) =>
      date != null ? _dateFormat.format(date) : '';


  Future<void> loadUpcomingMovies() async {
    final moviesResponse = await loadService.upcomingMovie();
    movies.addAll(moviesResponse.movies);
    notifyListeners();
  }

  void upcomingOnMovieTap(BuildContext context, int index) {
    final id = movies[index].id;
    Navigator.of(context).pushNamed(
      MainNavigationRouteNames.movieDetails,
      arguments: id,
    );
  }
}
