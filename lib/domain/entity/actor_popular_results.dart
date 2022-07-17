
import 'package:json_annotation/json_annotation.dart';
import 'package:movieapp/domain/entity/actor_popular_knownfor.dart';
part 'actor_popular_results.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Results {
  final String profilePath;
  final bool adult;
  final int id;
  final List<KnownFor> knownFor;
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