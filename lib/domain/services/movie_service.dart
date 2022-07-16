import 'package:movieapp/configuration/configuration.dart';
import 'package:movieapp/domain/api_client/AccountApiClient.dart';
import 'package:movieapp/domain/api_client/movie_api_client.dart';
import 'package:movieapp/domain/data_providers/session_data_provider.dart';
import 'package:movieapp/domain/entity/actor_popular.dart';
import 'package:movieapp/domain/entity/movie_favorite_response.dart';
import 'package:movieapp/domain/entity/movie_upcoming_response.dart';
import 'package:movieapp/domain/entity/popular_movie_response.dart';
import 'package:movieapp/domain/locale_entity/movie_details_locale.dart';
import 'package:movieapp/widgets/movie_details/movie_details_model.dart';
import 'package:movieapp/widgets/movie_favorites/movie_favorite_model.dart';
import 'package:movieapp/widgets/movie_home/movie_home_upcoming_view_model.dart';
import 'package:movieapp/widgets/movie_list/movie_list_model.dart';

class MovieService
    implements
        MovieDetailsModelMovieProvider,
        MovieListViewModelMovieProvider,
        MovieFavoriteViewModelLoadFavoriteMovie,
        MovieUpcomingViewModelLoadUpcoming {
  final MovieApiClient movieApiClient;
  final AccountApiClient accountApiClient;
  final SessionDataProvider sessionDataProvider;

  const MovieService({
    required this.movieApiClient,
    required this.accountApiClient,
    required this.sessionDataProvider,
  });

  @override
  Future<MovieUpcomingResponse> upcomingMovie() async =>
      movieApiClient.upcomingMovies(
        Configuration.apiKey,
      );

  @override
  Future<PopularMovieResponse> popularMovie(int page, String locale) async =>
      movieApiClient.popularMovie(
        page,
        locale,
        Configuration.apiKey,
      );

  @override
  Future<PopularMovieResponse> searchMovie(
          int page, String locale, String query) async =>
      movieApiClient.searchMovie(
        page,
        locale,
        query,
        Configuration.apiKey,
      );

  @override
  Future<MovieFavoriteResponse> loadFavoriteMovie() async {
    final accountId = await sessionDataProvider.getAccountId();
    final sessionId = await sessionDataProvider.getSessionId();
    return await movieApiClient.favoriteMovie(
        accountId!, Configuration.apiKey, sessionId!);
  }

  @override
  Future<ActorPopular> loadActor() async =>
      movieApiClient.actorPopular(
        Configuration.apiKey,
      );

  @override
  Future<MovieDetailsLocale> loadDetails({
    required int movieId,
    required String locale,
  }) async {
    final _movieDetails = await movieApiClient.movieDetails(movieId, locale);
    final sessionId = await sessionDataProvider.getSessionId();
    var isFavorite = false;
    if (sessionId != null) {
      isFavorite = await movieApiClient.isFavorite(movieId, sessionId);
    }
    return MovieDetailsLocale(
      details: _movieDetails,
      isFavorite: isFavorite,
    );
  }

  @override
  Future<void> updateFavorite({
    required bool isFavorite,
    required int movieId,
  }) async {
    final accountId = await sessionDataProvider.getAccountId();
    final sessionId = await sessionDataProvider.getSessionId();

    if (sessionId == null || accountId == null) return;

    await accountApiClient.markAsFavorite(
      accountId: accountId,
      sessionId: sessionId,
      mediaType: MediaType.movie,
      mediaId: movieId,
      isFavorite: isFavorite,
    );
  }
}
