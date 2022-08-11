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

  int pagePagination = 1;

  Future<void> fetchAllMovie() async {
    final result = await _apiProvider.getPopularMovie();
    _movieModels = result!;
    for (var data in _movieModels!.results) {
      _listResults.add(data);
    }
    notifyListeners();
  }

  Results getDataById(int index) {
    // var result = _listResults.firstWhere((element) => ele);
    var result = _listResults.elementAt(index);
    return result;
  }

  Results getDataByIndex(int index) {
    var value = _listResults.elementAt(index);
    return value;
  }

  Future<List<Results>?> fetchSomeMoreData() async {
    try {
      var results = await _apiProvider.paginationFetchData(pagePagination);
      for (var data in results!.results) {
        if (!_listResults.contains(data)) {
          _listResults.add(data);
        }
      }
      pagePagination = pagePagination + 1;
      notifyListeners();
      return _listResults;
    } catch (error) {
      // print(error.toString());
      return null;
    }
  }
}
