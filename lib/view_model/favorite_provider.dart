import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movie_app_tmdb/get_locator.dart';
import 'package:movie_app_tmdb/models/result_object.dart';
import 'package:movie_app_tmdb/router/navigation_service.dart';

class FavoriteProvider extends ChangeNotifier {
  final hiveBox = Hive.box<Results>('favorites');
  final List<Results> _favorite = [];

  List<Results> get listFavorite => _favorite;

  void addToFavoriteBox(Results data) {
    ScaffoldMessenger.of(
            getInstance<NavigationService>().navigatorKey.currentContext!)
        .showSnackBar(
      const SnackBar(
        content: Text("Succes add to favorite"),
      ),
    );
    hiveBox.add(data);
    if (!_favorite.contains(data)) {
      _favorite.add(data);
    }
    notifyListeners();
  }

  compareObject(Results data) {
    print(_favorite.contains(data));
  }
}
