
import 'package:json_annotation/json_annotation.dart';
part 'actor_popular.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class ActorPopular {
  final int page;
  @JsonKey(name: 'results')
  final List<Results> actor;
  final int totalResults;
  final int totalPages;

  ActorPopular({
    required this.page,
    required this.actor,
    required this.totalResults,
    required this.totalPages,
  });

  factory ActorPopular.fromJson(Map<String, dynamic> json) => _$ActorPopularFromJson(json);
  Map<String, dynamic> toJson() => _$ActorPopularToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Results {
  final String profilePath;
  final bool adult;
  final int id;
  final KnownFor knownFor;
  final String name;
  final double popularity;

  Results({
    required this.profilePath,
    required this.adult,
    required this.id,
    required this.knownFor,
    required this.name,
    required this.popularity,
  });

  factory Results.fromJson(Map<String, dynamic> json) => _$ResultsFromJson(json);
  Map<String, dynamic> toJson() => _$ResultsToJson(this);
}


@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class KnownFor {
  final String posterPath;
  final bool adult;
  final String overview;
  final String releaseDate;
  final String originalTitle;
  final List<int> genreIds;
  final int id;
  final String mediaType;
  final String originalLanguage;
  final String title;
  final String? backdropPath;
  final double popularity;
  final int voteCount;
  final bool video;
  final double voteAverage;

  KnownFor({
    required this.posterPath,
    required this.adult,
    required this.overview,
    required this.releaseDate,
    required this.originalTitle,
    required this.genreIds,
    required this.id,
    required this.mediaType,
    required this.originalLanguage,
    required this.title,
    required this.backdropPath,
    required this.popularity,
    required this.voteCount,
    required this.video,
    required this.voteAverage,
  });

  factory KnownFor.fromJson(Map<String, dynamic> json) => _$KnownForFromJson(json);
  Map<String, dynamic> toJson() => _$KnownForToJson(this);
}
