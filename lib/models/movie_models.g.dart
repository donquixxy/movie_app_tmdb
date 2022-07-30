// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieModels _$MovieModelsFromJson(Map<String, dynamic> json) => MovieModels(
      page: json['page'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => Results.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieModelsToJson(MovieModels instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
    };
