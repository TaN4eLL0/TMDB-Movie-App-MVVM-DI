import 'package:movieapp/configuration/configuration.dart';
import 'package:movieapp/domain/api_client/network_client.dart';
import 'package:movieapp/domain/entity/movie_details.dart';
import 'package:movieapp/domain/entity/movie_favorite_response.dart';
import 'package:movieapp/domain/entity/popular_movie_response.dart';

abstract class MovieApiClient {
  Future<MovieFavoriteResponse> favoriteMovie(
    int accountId,
    String apiKey,
    String sessionId,
  );

  Future<PopularMovieResponse> popularMovie(
    int page,
    String locale,
    String apiKey,
  );

  Future<PopularMovieResponse> searchMovie(
    int page,
    String locale,
    String query,
    String apiKey,
  );

  Future<MovieDetails> movieDetails(
    int movieId,
    String locale,
  );

  Future<bool> isFavorite(
    int movieId,
    String sessionId,
  );
}

class MovieApiClientDefault implements MovieApiClient {
  final NetworkClient networkClient;

  const MovieApiClientDefault(this.networkClient);

  @override
  Future<MovieFavoriteResponse> favoriteMovie(
    int accountId,
    String apiKey,
    String sessionId,
    // int page,
  ) async {
    MovieFavoriteResponse parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = MovieFavoriteResponse.fromJson(jsonMap);
      return response;
    }

    final result = networkClient.get(
      '/account/$accountId/favorite/movies',
      parser,
      <String, dynamic>{
        'api_key': apiKey,
        'session_id': sessionId,
      },
    );
    return result;
  }

  @override
  Future<PopularMovieResponse> popularMovie(
    int page,
    String locale,
    String apiKey,
  ) async {
    PopularMovieResponse parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = PopularMovieResponse.fromJson(jsonMap);
      return response;
    }

    final result = networkClient.get(
      '/movie/popular',
      parser,
      <String, dynamic>{
        'api_key': apiKey,
        'page': page.toString(),
        'language': locale,
      },
    );
    return result;
  }

  @override
  Future<PopularMovieResponse> searchMovie(
    int page,
    String locale,
    String query,
    String apiKey,
  ) async {
    PopularMovieResponse parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = PopularMovieResponse.fromJson(jsonMap);
      return response;
    }

    final result = networkClient.get(
      '/search/movie',
      parser,
      <String, dynamic>{
        'api_key': apiKey,
        'page': page.toString(),
        'language': locale,
        'query': query,
        'include_adult': true.toString(),
      },
    );
    return result;
  }

  @override
  Future<MovieDetails> movieDetails(
    int movieId,
    String locale,
  ) async {
    MovieDetails parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = MovieDetails.fromJson(jsonMap);
      return response;
    }

    final result = networkClient.get(
      '/movie/$movieId',
      parser,
      <String, dynamic>{
        'append_to_response': 'credits,videos',
        'api_key': Configuration.apiKey,
        'language': locale,
      },
    );
    return result;
  }

  @override
  Future<bool> isFavorite(
    int movieId,
    String sessionId,
  ) async {
    bool parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final result = jsonMap['favorite'] as bool;
      return result;
    }

    final result = networkClient.get(
      '/movie/$movieId/account_states',
      parser,
      <String, dynamic>{
        'api_key': Configuration.apiKey,
        'session_id': sessionId,
      },
    );
    return result;
  }
}
