// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actor_popular_results.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Results _$ResultsFromJson(Map<String, dynamic> json) => Results(
      profilePath: json['profile_path'] as String?,
      adult: json['adult'] as bool,
      id: json['id'] as int,
      knownFor: (json['known_for'] as List<dynamic>)
          .map((e) => KnownFor.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String,
      popularity: (json['popularity'] as num).toDouble(),
    );

Map<String, dynamic> _$ResultsToJson(Results instance) => <String, dynamic>{
      'profile_path': instance.profilePath,
      'adult': instance.adult,
      'id': instance.id,
      'known_for': instance.knownFor.map((e) => e.toJson()).toList(),
      'name': instance.name,
      'popularity': instance.popularity,
    };
