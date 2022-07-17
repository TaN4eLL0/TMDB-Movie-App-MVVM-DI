// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actor_popular_knownfor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KnownFor _$KnownForFromJson(Map<String, dynamic> json) => KnownFor(
      posterPath: json['poster_path'] as String?,
      adult: json['adult'] as bool?,
      overview: json['overview'] as String?,
      releaseDate: json['release_date'] as String?,
      originalTitle: json['original_title'] as String?,
      genreIds:
          (json['genre_ids'] as List<dynamic>).map((e) => e as int).toList(),
      id: json['id'] as int?,
      mediaType: json['media_type'] as String?,
      originalLanguage: json['original_language'] as String?,
      title: json['title'] as String?,
      backdropPath: json['backdrop_path'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      voteCount: json['vote_count'] as int?,
      video: json['video'] as bool?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$KnownForToJson(KnownFor instance) => <String, dynamic>{
      'poster_path': instance.posterPath,
      'adult': instance.adult,
      'overview': instance.overview,
      'release_date': instance.releaseDate,
      'original_title': instance.originalTitle,
      'genre_ids': instance.genreIds,
      'id': instance.id,
      'media_type': instance.mediaType,
      'original_language': instance.originalLanguage,
      'title': instance.title,
      'backdrop_path': instance.backdropPath,
      'popularity': instance.popularity,
      'vote_count': instance.voteCount,
      'video': instance.video,
      'vote_average': instance.voteAverage,
    };
