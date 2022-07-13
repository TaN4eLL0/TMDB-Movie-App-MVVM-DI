
import 'package:json_annotation/json_annotation.dart';
import 'package:movieapp/domain/entity/movie_favorite.dart';
part 'movie_favorite_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class MovieFavoriteResponse {
  final int page;
  @JsonKey(name: 'results')
  final List<MovieFavorite> movies;
  final int totalPages;
  final int totalResults;

  MovieFavoriteResponse({
    required this.page,
    required this.movies,
    required this.totalPages,
    required this.totalResults,
  });

  factory MovieFavoriteResponse.fromJson(Map<String, dynamic> json) => _$MovieFavoriteResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieFavoriteResponseToJson(this);
}