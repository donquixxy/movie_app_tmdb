import 'package:flutter/material.dart';
import 'package:movie_app_tmdb/api_provider/api_provider.dart';
import 'package:movie_app_tmdb/models/movie_models.dart';
import 'package:movie_app_tmdb/models/result_object.dart';

class MovieProvider extends ChangeNotifier {
  final ApiProvider _provider = ApiProvider();
  MovieModels? movieModels;

  final List<Results> _resultsData = [];

  List<Results> get results => _resultsData;

  void nextPage(int value) {
    movieModels!.page = value;
    notifyListeners();
  }

  Future<void> fetchPopularMovie() async {
    var result = await _provider.getPopularMovie();
    movieModels = result;
    for (var data in movieModels!.results) {
      _resultsData.add(data);
    }
    notifyListeners();
  }
}
