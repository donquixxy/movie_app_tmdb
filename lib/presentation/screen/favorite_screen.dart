import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app_tmdb/get_locator.dart';
import 'package:movie_app_tmdb/models/result_object.dart';
import 'package:movie_app_tmdb/presentation/widget/favorite_card_widget.dart';
import 'package:movie_app_tmdb/router/navigation_service.dart';
import 'package:movie_app_tmdb/router/router_name.dart';
import 'package:movie_app_tmdb/view_model/favorite_provider.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);

    return ValueListenableBuilder(
      valueListenable: favoriteProvider.fetchDataFromDb,
      builder: (BuildContext context, Box<Results> box, widget) {
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(12),
          itemCount: box.values.length,
          itemBuilder: (BuildContext context, int index) {
            var data = box.values.toList()[index];
            return ChangeNotifierProvider.value(
              value: data,
              child: GestureDetector(
                  onLongPress: () {
                    favoriteProvider.removeDataFromHive(index);
                  },
                  onTap: () {
                    getInstance<NavigationService>()
                        .navigateTo(detailRoute, arguments: data);
                  },
                  child: FavoriteCard(index)),
            );
          },
        );
      },
    );
  }
}
