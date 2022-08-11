import 'package:flutter/cupertino.dart';
import 'package:movie_app_tmdb/api_provider/api_provider.dart';
import 'package:movie_app_tmdb/models/movie_models.dart';
import 'package:movie_app_tmdb/models/result_object.dart';

class SearchProviderResults extends ChangeNotifier {
  final ApiProvider _apiProvider = ApiProvider();

  List<Results> _searchResults = [];

  List<Results> get searchResultsData => _searchResults;
  MovieModels? _searchMovieModels;

  MovieModels? get movieModelsSearch => _searchMovieModels;

  Future<MovieModels?> searchWithQuery(String query) async {
    var results = await _apiProvider.searchWithQuery(query);
    _searchMovieModels = results;
    for (var data in _searchMovieModels!.results) {
      if (_searchResults.isEmpty) {
        _searchResults.add(data);
      }
    }
    notifyListeners();
    return _searchMovieModels;
  }
}
