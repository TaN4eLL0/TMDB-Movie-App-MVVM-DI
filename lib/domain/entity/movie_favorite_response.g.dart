// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_favorite_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieFavoriteResponse _$MovieFavoriteResponseFromJson(
        Map<String, dynamic> json) =>
    MovieFavoriteResponse(
      page: json['page'] as int,
      movies: (json['results'] as List<dynamic>)
          .map((e) => MovieFavorite.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['total_pages'] as int,
      totalResults: json['total_results'] as int,
    );

Map<String, dynamic> _$MovieFavoriteResponseToJson(
        MovieFavoriteResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.movies.map((e) => e.toJson()).toList(),
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
