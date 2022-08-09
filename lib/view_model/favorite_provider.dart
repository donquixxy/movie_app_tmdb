import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movie_app_tmdb/get_locator.dart';
import 'package:movie_app_tmdb/models/result_object.dart';
import 'package:movie_app_tmdb/router/navigation_service.dart';

class FavoriteProvider extends ChangeNotifier {
  final hiveBox = Hive.box<Results>('favorites');

  void addToFavoriteBox(Results data) {
    if (!hiveBox.values.contains(data)) {
      hiveBox.add(data);
    }
    ScaffoldMessenger.of(
            getInstance<NavigationService>().navigatorKey.currentContext!)
        .showSnackBar(
      const SnackBar(
        content: Text("Succes add to favorite"),
      ),
    );
    notifyListeners();
  }

  ValueListenable<Box<Results>> get fetchDataFromDb =>
      Hive.box<Results>('favorites').listenable();

  compareObject(Results data) {
    // print(_favorite.contains(data));
    print("SPACE");
    print(hiveBox.values.toList().contains(data));
  }

  void removeDataFromHive(int index) {
    hiveBox.deleteAt(index);
    notifyListeners();
    ScaffoldMessenger.of(
            getInstance<NavigationService>().navigatorKey.currentContext!)
        .showSnackBar(
      const SnackBar(
        content: Text("Deleted"),
      ),
    );
  }
}
