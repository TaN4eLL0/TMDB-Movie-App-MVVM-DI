import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movieapp/Library/Widgets/localized_model.dart';
import 'package:movieapp/domain/api_client/api_client_exception.dart';
import 'package:movieapp/domain/entity/movie_details.dart';
import 'package:movieapp/domain/locale_entity/movie_details_locale.dart';
import 'package:movieapp/navigation/main_navigation_actions.dart';

class MovieDetailsPosterData {
  final String? posterPath;
  final String? backdropPath;

  MovieDetailsPosterData({
    this.posterPath,
    this.backdropPath,
  });
}

class MovieDetailsFavoriteData {
  final bool isFavorite;

  IconData get favoriteIcon => isFavorite ? Icons.clear : Icons.add;

  MovieDetailsFavoriteData({
    this.isFavorite = false,
  });

  MovieDetailsFavoriteData copyWith({
    bool? isFavorite,
  }) {
    return MovieDetailsFavoriteData(
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}

class MovieDetailsNameData {
  final String name;
  final String year;

  MovieDetailsNameData({
    required this.year,
    required this.name,
  });
}

class MovieDetailsScorerData {
  final double voteAverage;
  final String? trailerKey;

  MovieDetailsScorerData({
    required this.voteAverage,
    this.trailerKey,
  });
}

class MovieDetailsPeopleData {
  final String name;
  final String job;

  MovieDetailsPeopleData({
    required this.name,
    required this.job,
  });
}

class MovieDetailsActorData {
  final String name;
  final String character;
  final String? profilePath;

  MovieDetailsActorData({
    required this.name,
    required this.character,
    this.profilePath,
  });
}

class MovieDetailsData {
  String title = '';
  bool isLoading = true;
  String overview = '';
  MovieDetailsPosterData posterData = MovieDetailsPosterData();
  MovieDetailsFavoriteData favoriteData = MovieDetailsFavoriteData();
  MovieDetailsNameData nameData = MovieDetailsNameData(
    name: '',
    year: '',
  );
  MovieDetailsScorerData scoreData = MovieDetailsScorerData(voteAverage: 0);
  String summary = '';
  List<List<MovieDetailsPeopleData>> peopleData =
      const <List<MovieDetailsPeopleData>>[];
  List<MovieDetailsActorData> actorsData = const <MovieDetailsActorData>[];
}

abstract class MovieDetailsModelLogoutProvider {
  Future<void> logout();
}

abstract class MovieDetailsModelMovieProvider {
  Future<MovieDetailsLocale> loadDetails({
    required int movieId,
    required String locale,
  });

  Future<void> updateFavorite({
    required bool isFavorite,
    required int movieId,
  });
}

class MovieDetailsModel extends ChangeNotifier {
  final MovieDetailsModelLogoutProvider logoutProvider;
  final MovieDetailsModelMovieProvider movieProvider;
  final MainNavigationActions navigationActions;

  final int movieId;
  final data = MovieDetailsData();
  final _localeStorage = LocalizedModelStorage();
  late DateFormat _dateFormat;

  MovieDetailsModel(
    this.movieId, {
    required this.movieProvider,
    required this.logoutProvider,
    required this.navigationActions,
  });

  Future<void> setupLocale(BuildContext context, Locale locale) async {
    if (!_localeStorage.updateLocale(locale)) return;
    _dateFormat = DateFormat.yMMMMd(_localeStorage.localeTag);
    updateData(null, false);
    await loadDetails(context);
  }

  void updateData(MovieDetails? details, bool isFavorite) {
    data.title = details?.title ?? 'Loading...';
    data.isLoading = details == null;
    if (details == null) {
      notifyListeners();
      return;
    }
    data.overview = details.overview ?? '';
    data.posterData = MovieDetailsPosterData(
      backdropPath: details.backdropPath,
      posterPath: details.posterPath,
      // isFavorite: isFavorite,
    );
    data.favoriteData = MovieDetailsFavoriteData(
      isFavorite: isFavorite,
    );
    var year = details.releaseDate?.year.toString();
    year = year != null ? ' ($year)' : '';
    data.nameData = MovieDetailsNameData(
      year: year,
      name: details.title,
    );
    final videos = details.videos.results
        .where((video) => video.type == 'Trailer' && video.site == 'YouTube');
    final trailerKey = videos.isNotEmpty == true ? videos.first.key : null;
    final voteAverage = details.voteAverage;
    data.scoreData = MovieDetailsScorerData(
      trailerKey: trailerKey,
      voteAverage: voteAverage * 10,
    );
    data.summary = makeSummary(details);
    data.peopleData = makePeopleData(details);
    data.actorsData = details.credits.cast
        .map((e) => MovieDetailsActorData(
              name: e.name,
              character: e.character,
              profilePath: e.profilePath,
            ))
        .toList();

    notifyListeners();
  }

  List<List<MovieDetailsPeopleData>> makePeopleData(MovieDetails details) {
    var crew = details.credits.crew
        .map((e) => MovieDetailsPeopleData(
              name: e.name,
              job: e.job,
            ))
        .toList();
    crew = crew.length > 4 ? crew.sublist(0, 4) : crew;
    var crewChunks = <List<MovieDetailsPeopleData>>[];
    for (var i = 0; i < crew.length; i += 2) {
      crewChunks.add(
        crew.sublist(i, i + 2 > crew.length ? crew.length : i + 2),
      );
    }
    return crewChunks;
  }

  String makeSummary(MovieDetails details) {
    var texts = <String>[];
    final releaseDate = details.releaseDate;
    if (releaseDate != null) {
      texts.add(_dateFormat.format(releaseDate));
    }
    if (details.productionCountries.isNotEmpty) {
      texts.add('(${details.productionCountries.first.iso})');
    }
    final runTime = details.runtime ?? 0;
    final duration = Duration(minutes: runTime);
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    texts.add('${hours}h ${minutes}m');

    if (details.genres.isNotEmpty) {
      var genresNames = <String>[];
      for (var genr in details.genres) {
        genresNames.add(genr.name);
      }
      texts.add(genresNames.join(', '));
    }
    return texts.join(' ');
  }

  Future<void> loadDetails(BuildContext context) async {
    try {
      final details = await movieProvider.loadDetails(
        movieId: movieId,
        locale: _localeStorage.localeTag,
      );
      updateData(details.details, details.isFavorite);
    } on ApiClientException catch (e) {
      _handleApiClientException(e, context);
    }
  }

  Future<void> toggleFavorite(BuildContext context) async {
    data.favoriteData =
        data.favoriteData.copyWith(isFavorite: !data.favoriteData.isFavorite);
    notifyListeners();
    try {
      await movieProvider.updateFavorite(
        isFavorite: data.favoriteData.isFavorite,
        movieId: movieId,
      );
    } on ApiClientException catch (e) {
      _handleApiClientException(e, context);
    }
  }

  void _handleApiClientException(
    ApiClientException exception,
    BuildContext context,
  ) async {
    switch (exception.type) {
      case ApiClientExceptionType.sessionExpired:
        logoutProvider.logout();
        navigationActions.resetNavigation(context);
        break;
      default:
        print(exception);
    }
  }
}
