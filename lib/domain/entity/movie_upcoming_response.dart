import 'package:json_annotation/json_annotation.dart';
import 'package:movieapp/domain/entity/movie_upcoming.dart';
import 'package:movieapp/domain/entity/upcoming_dates.dart';

part 'movie_upcoming_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class MovieUpcomingResponse {
  final int page;
  @JsonKey(name: 'results')
  final List<MovieUpcoming> movies;
  @JsonKey(name: 'dates')
  final DatesUpcoming dates;
  final int totalResults;
  final int totalPages;

  MovieUpcomingResponse({
    required this.page,
    required this.movies,
    required this.dates,
    required this.totalResults,
    required this.totalPages,
  });

  factory MovieUpcomingResponse.fromJson(Map<String, dynamic> json) => _$MovieUpcomingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieUpcomingResponseToJson(this);
}
