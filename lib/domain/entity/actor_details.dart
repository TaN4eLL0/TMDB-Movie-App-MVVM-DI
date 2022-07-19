import 'package:json_annotation/json_annotation.dart';
import 'package:movieapp/domain/entity/actor_details_movie.dart';

part 'actor_details.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class ActorDetails {
  final String? birthday;
  final String? knownForDepartment;
  final String? deathday;
  final int? id;
  final String? name;
  final List<String?>? alsoKnownAs;
  final int? gender;
  final String? biography;
  final double? popularity;
  final String? placeOfBirth;
  final String? profilePath;
  final bool? adult;
  final String? imdbId;
  final String? homepage;
  final ActorDetailsMovie movieCredits;

  ActorDetails(
    this.birthday,
    this.knownForDepartment,
    this.deathday,
    this.id,
    this.name,
    this.alsoKnownAs,
    this.gender,
    this.biography,
    this.popularity,
    this.placeOfBirth,
    this.profilePath,
    this.adult,
    this.imdbId,
    this.homepage,
    this.movieCredits,
  );

  factory ActorDetails.fromJson(Map<String, dynamic> json) =>
      _$ActorDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$ActorDetailsToJson(this);
}
