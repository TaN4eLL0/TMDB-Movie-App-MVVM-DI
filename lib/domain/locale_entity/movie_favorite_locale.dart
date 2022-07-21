import 'package:movieapp/domain/entity/movie_favorite_response.dart';

class MovieFavoriteLocale {
  final MovieFavoriteResponse favoriteResponse;
  final bool isFavorite;

  MovieFavoriteLocale({
    required this.favoriteResponse,
    required this.isFavorite,
  });
}
