
import 'package:json_annotation/json_annotation.dart';
import 'package:movieapp/domain/entity/movie_rated.dart';

part 'movie_rated_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class MovieRatedResponse {
  final int page;
  @JsonKey(name: 'results')
  final List<MovieRated> movies;
  final int totalResults;
  final int totalPages;

  MovieRatedResponse({
    required this.page,
    required this.movies,
    required this.totalResults,
    required this.totalPages,
  });

  factory MovieRatedResponse.fromJson(Map<String, dynamic> json) => _$MovieRatedResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieRatedResponseToJson(this);
}