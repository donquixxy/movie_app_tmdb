// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app_tmdb/models/result_object.dart';
part 'movie_models.g.dart';

@JsonSerializable()
class MovieModels {
  int page;
  List<Results> results;

  MovieModels({required this.page, required this.results});

  factory MovieModels.fromJson(Map<String, dynamic> json) =>
      _$MovieModelsFromJson(json);
}
