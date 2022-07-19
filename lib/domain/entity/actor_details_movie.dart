import 'package:json_annotation/json_annotation.dart';

part 'actor_details_movie.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class ActorDetailsMovie {
  final List<Cast> cast;
  final List<Crew> crew;
  final int? id;

  ActorDetailsMovie({
      required this.cast,
      required this.crew,
      required this.id,
  });

  factory ActorDetailsMovie.fromJson(Map<String, dynamic> json) => _$ActorDetailsMovieFromJson(json);
  Map<String, dynamic> toJson() => _$ActorDetailsMovieToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Cast {
  final String character;
  final String creditId;
  final String releaseDate;
  final int voteCount;
  final bool video;
  final bool adult;
  final double voteAverage;
  final String title;
  final List<int> genreIds;
  final String originalLanguage;
  final String originalTitle;
  final double popularity;
  final int id;
  final String? backdropPath;
  final String overview;
  final String? posterPath;

  Cast({
    required this.character,
    required this.creditId,
    required this.releaseDate,
    required this.voteCount,
    required this.video,
    required this.adult,
    required this.voteAverage,
    required this.title,
    required this.genreIds,
    required this.originalLanguage,
    required this.originalTitle,
    required this.popularity,
    required this.id,
    required this.backdropPath,
    required this.overview,
    required this.posterPath,
  });

  factory Cast.fromJson(Map<String, dynamic> json) => _$CastFromJson(json);
  Map<String, dynamic> toJson() => _$CastToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Crew {
  final int id;
  final String department;
  final String originalLanguage;
  final String originalTitle;
  final String job;
  final String overview;
  final int voteCount;
  final bool video;
  final String? posterPath;
  final String? backdropPath;
  final String title;
  final double popularity;
  final List<int> genreIds;
  final double voteAverage;
  final bool adult;
  final String releaseDate;
  final String creditId;

  Crew({
      required this.id,
      required this.department,
      required this.originalLanguage,
      required this.originalTitle,
      required this.job,
      required this.overview,
      required this.voteCount,
      required this.video,
      required this.posterPath,
      required this.backdropPath,
      required this.title,
      required this.popularity,
      required this.genreIds,
      required this.voteAverage,
      required this.adult,
      required this.releaseDate,
      required this.creditId,
  });

  factory Crew.fromJson(Map<String, dynamic> json) => _$CrewFromJson(json);
  Map<String, dynamic> toJson() => _$CrewToJson(this);
}

