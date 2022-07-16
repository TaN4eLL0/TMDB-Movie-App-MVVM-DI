// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_upcoming_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieUpcomingResponse _$MovieUpcomingResponseFromJson(
        Map<String, dynamic> json) =>
    MovieUpcomingResponse(
      page: json['page'] as int,
      movies: (json['results'] as List<dynamic>)
          .map((e) => MovieUpcoming.fromJson(e as Map<String, dynamic>))
          .toList(),
      dates: DatesUpcoming.fromJson(json['dates'] as Map<String, dynamic>),
      totalResults: json['total_results'] as int,
      totalPages: json['total_pages'] as int,
    );

Map<String, dynamic> _$MovieUpcomingResponseToJson(
        MovieUpcomingResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.movies.map((e) => e.toJson()).toList(),
      'dates': instance.dates.toJson(),
      'total_results': instance.totalResults,
      'total_pages': instance.totalPages,
    };
