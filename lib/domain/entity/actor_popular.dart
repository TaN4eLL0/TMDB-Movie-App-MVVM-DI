
import 'package:json_annotation/json_annotation.dart';
import 'package:movieapp/domain/entity/actor_popular_results.dart';
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
