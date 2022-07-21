import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movieapp/Library/Widgets/localized_model.dart';
import 'package:movieapp/Library/Widgets/paginator.dart';
import 'package:movieapp/domain/entity/movie_rated.dart';
import 'package:movieapp/domain/entity/movie_rated_response.dart';
import 'package:movieapp/navigation/main_navigation_route_names.dart';

class MovieRatedRowData {
  final int id;
  final String? posterPath;
  final String title;
  final String releaseDate;
  final String overview;

  MovieRatedRowData({
    required this.id,
    required this.posterPath,
    required this.title,
    required this.releaseDate,
    required this.overview,
  });
}

abstract class MovieRatedViewModelLoad {
  Future<MovieRatedResponse> ratedMovie(int page, String locale);

  Future<MovieRatedResponse> searchMovieRated(
      int page, String locale, String query);
}

class MovieRatedViewModel extends ChangeNotifier {
  final MovieRatedViewModelLoad movieLoad;
  late final Paginator<MovieRated> _ratedMoviePaginator;
  late final Paginator<MovieRated> _searchMoviePaginator;
  final _localeStorage = LocalizedModelStorage();

  Timer? searchDebounce;

  var _movies = <MovieRatedRowData>[];
  String? _searchQuery;

  bool get isSearchMode {
    final searchQuery = _searchQuery;
    return searchQuery != null && searchQuery.isNotEmpty;
  }

  List<MovieRatedRowData> get movies => List.unmodifiable(_movies);

  late DateFormat _dateFormat;

  MovieRatedViewModel({
    required this.movieLoad,
  }) {
    _ratedMoviePaginator = Paginator<MovieRated>((page) async {
      final result =
      await movieLoad.ratedMovie(page, _localeStorage.localeTag);
      return PaginatorLoadResult(
        data: result.movies,
        currentPage: result.page,
        totalPage: result.totalPages,
      );
    });
    _searchMoviePaginator = Paginator<MovieRated>((page) async {
      final result = await movieLoad.searchMovieRated(
        page,
        _localeStorage.localeTag,
        _searchQuery ?? '',
      );
      return PaginatorLoadResult(
        data: result.movies,
        currentPage: result.page,
        totalPage: result.totalPages,
      );
    });
  }

  Future<void> setupLocale(Locale locale) async {
    if (!_localeStorage.updateLocale(locale)) return;
    _dateFormat = DateFormat.yMMMMd(_localeStorage.localeTag);
    await _resetList();
  }

  Future<void> _resetList() async {
    await _ratedMoviePaginator.reset();
    await _searchMoviePaginator.reset();
    _movies.clear();
    await _loadNextPage();
  }

  Future<void> _loadNextPage() async {
    if (isSearchMode) {
      await _searchMoviePaginator.loadNextPage();
      _movies = _searchMoviePaginator.data.map(_makeRowData).toList();
    } else {
      await _ratedMoviePaginator.loadNextPage();
      _movies = _ratedMoviePaginator.data.map(_makeRowData).toList();
    }
    notifyListeners();
  }

  MovieRatedRowData _makeRowData(MovieRated movie) {
    final releaseDate = movie.releaseDate;
    final releaseDateTitle =
    releaseDate != null ? _dateFormat.format(releaseDate) : '';
    return MovieRatedRowData(
      id: movie.id,
      title: movie.title,
      releaseDate: releaseDateTitle,
      posterPath: movie.posterPath,
      overview: movie.overview,
    );
  }

  void onMovieTap(BuildContext context, int index) {
    final id = _movies[index].id;
    Navigator.of(context).pushNamed(
      MainNavigationRouteNames.movieDetails,
      arguments: id,
    );
  }

  Future<void> searchMovie(String text) async {
    searchDebounce?.cancel();
    searchDebounce = Timer(const Duration(milliseconds: 300), () async {
      final searchQuery = text.isNotEmpty ? text : null;
      if (_searchQuery == searchQuery) return;
      _searchQuery = searchQuery;
      _movies.clear();
      if (isSearchMode) {
        await _searchMoviePaginator.reset();
      }
      _loadNextPage();
    });
  }

  void showedMovieAtIndex(int index) {
    if (index < _movies.length - 1) return;
    _loadNextPage();
  }
}
