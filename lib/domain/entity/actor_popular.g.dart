// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actor_popular.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActorPopular _$ActorPopularFromJson(Map<String, dynamic> json) => ActorPopular(
      page: json['page'] as int,
      actor: (json['results'] as List<dynamic>)
          .map((e) => Results.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalResults: json['total_results'] as int,
      totalPages: json['total_pages'] as int,
    );

Map<String, dynamic> _$ActorPopularToJson(ActorPopular instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.actor.map((e) => e.toJson()).toList(),
      'total_results': instance.totalResults,
      'total_pages': instance.totalPages,
    };
