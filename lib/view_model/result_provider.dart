import 'package:flutter/material.dart';
import 'package:movie_app_tmdb/api_provider/api_provider.dart';
import 'package:movie_app_tmdb/models/movie_models.dart';
import 'package:movie_app_tmdb/models/result_object.dart';

class ResultProvider extends ChangeNotifier {
  final ApiProvider _apiProvider = ApiProvider();
  MovieModels? _movieModels;

  MovieModels? get movieModels => _movieModels;

  final List<Results> _listResults = [];

  List<Results> get listData => _listResults;

  Future<void> fetchAllMovie() async {
    final result = await _apiProvider.getPopularMovie();
    _movieModels = result!;
    for (var data in _movieModels!.results) {
      _listResults.add(data);
    }
    notifyListeners();
  }

  Results getDataById(int id) {
    var result = _listResults.firstWhere((element) => element.id == id);
    return result;
  }
}
