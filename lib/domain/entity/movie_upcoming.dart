import 'package:json_annotation/json_annotation.dart';
import 'package:movieapp/domain/entity/movie_date_parser.dart';


part 'movie_upcoming.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MovieUpcoming {
  final String? posterPath;
  final bool adult;
  final String overview;
  @JsonKey(fromJson: parseMovieDateFromString)
  final DateTime? releaseDate;
  final List<int> genre_ids;
  final int id;
  final String originalTitle;
  final String originalLanguage;
  final String title;
  final String? backdropPath;
  final double popularity;
  final int voteCount;
  final bool video;
  final double voteAverage;

  MovieUpcoming({
    required this.posterPath,
    required this.adult,
    required this.overview,
    required this.releaseDate,
    required this.genre_ids,
    required this.id,
    required this.originalTitle,
    required this.originalLanguage,
    required this.title,
    required this.backdropPath,
    required this.popularity,
    required this.voteCount,
    required this.video,
    required this.voteAverage,
  });

  factory MovieUpcoming.fromJson(Map<String, dynamic> json) => _$MovieUpcomingFromJson(json);

  Map<String, dynamic> toJson() => _$MovieUpcomingToJson(this);

}
