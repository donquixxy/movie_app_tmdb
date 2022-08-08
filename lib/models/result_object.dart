// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';
part 'result_object.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class Results extends Equatable with ChangeNotifier {
  @HiveField(0)
  final bool adult;

  @HiveField(1)
  final String backdrop_path;

  @HiveField(2)
  final List<int> genre_ids;

  @HiveField(3)
  final int id;

  @HiveField(4)
  final String original_language;

  @HiveField(5)
  final String original_title;

  @HiveField(6)
  final String overview;

  @HiveField(7)
  final double popularity;

  @HiveField(8)
  final String poster_path;

  @HiveField(9)
  final String release_date;

  @HiveField(10)
  final String title;

  @HiveField(11)
  final bool video;

  @HiveField(12)
  final double vote_average;

  @HiveField(13)
  final int vote_count;

  Results(
      {required this.adult,
      required this.backdrop_path,
      required this.genre_ids,
      required this.id,
      required this.original_language,
      required this.original_title,
      required this.overview,
      required this.popularity,
      required this.poster_path,
      required this.release_date,
      required this.title,
      required this.video,
      required this.vote_average,
      required this.vote_count});

  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);

  @override
  List<Object?> get props => [
        adult,
        backdrop_path,
        genre_ids,
        id,
        original_language,
        original_title,
        overview,
        popularity,
        poster_path,
        release_date,
        title,
        video,
        vote_average,
        vote_count
      ];
}
