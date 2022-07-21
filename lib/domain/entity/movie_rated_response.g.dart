// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_rated_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieRatedResponse _$MovieRatedResponseFromJson(Map<String, dynamic> json) =>
    MovieRatedResponse(
      page: json['page'] as int,
      movies: (json['results'] as List<dynamic>)
          .map((e) => MovieRated.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalResults: json['total_results'] as int,
      totalPages: json['total_pages'] as int,
    );

Map<String, dynamic> _$MovieRatedResponseToJson(MovieRatedResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.movies.map((e) => e.toJson()).toList(),
      'total_results': instance.totalResults,
      'total_pages': instance.totalPages,
    };
