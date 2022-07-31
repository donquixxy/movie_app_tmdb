import 'package:flutter/material.dart';
import 'package:movie_app_tmdb/api_provider/api_provider.dart';
import 'package:movie_app_tmdb/models/movie_models.dart';

class MovieProvider extends ChangeNotifier {
  final ApiProvider _provider = ApiProvider();
  // final List<MovieModels> _movieList = [];
  MovieModels? movieModels;

  // UnmodifiableListView<MovieModels> get dataList =>
  //     UnmodifiableListView<MovieModels>(_movieList);

  // List<MovieModels> get listMovie => _movieList;

  Future<void> fetchPopularMovie() async {
    var result = await _provider.getPopularMovie();
    // _movieList.add(result!);
    movieModels = result!;
    notifyListeners();
  }
}
