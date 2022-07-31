import 'package:flutter/material.dart';
import 'package:movie_app_tmdb/api_provider/api_provider.dart';
import 'package:movie_app_tmdb/models/movie_models.dart';

class MovieProvider extends ChangeNotifier {
  final ApiProvider _provider = ApiProvider();
  MovieModels? movieModels;

  Future<void> fetchPopularMovie() async {
    var result = await _provider.getPopularMovie();
    movieModels = result!;
    notifyListeners();
  }
}
