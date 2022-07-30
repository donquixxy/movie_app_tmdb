import 'package:dio/dio.dart';
import 'package:movie_app_tmdb/models/movie_models.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String baseKey = 'a714c9b141366003b042b9b43dc8c88f';
  final String baseUrl = 'https://api.themoviedb.org/3/movie/popular';
  final String language = 'en-US';

  Future<MovieModels?> getPopularMovie() async {
    try {
      Response results = await _dio.get(baseUrl, queryParameters: {
        'api_key': baseKey,
        'language': language,
      });

      if (results.statusCode != 200) {
        throw Exception('Failed to get data');
      }

      MovieModels movieModels = MovieModels.fromJson(results.data);
      return movieModels;
    } on Exception {
      // print(error.toString());
      return null;
    }
  }
}
