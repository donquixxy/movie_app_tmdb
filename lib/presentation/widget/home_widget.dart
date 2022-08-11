import 'package:flutter/material.dart';
import 'package:movie_app_tmdb/get_locator.dart';
import 'package:movie_app_tmdb/presentation/widget/card_widget.dart';
import 'package:movie_app_tmdb/router/navigation_service.dart';
import 'package:movie_app_tmdb/router/router_name.dart';
import 'package:movie_app_tmdb/view_model/result_provider.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final itemProvider = Provider.of<ResultProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Popular Movie ',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                TextButton(
                  onPressed: () {
                    getInstance<NavigationService>()
                        .navigateTo(paginationRoute);
                  },
                  child: const Text("See all"),
                )
              ],
            ),
          ),
          GridView.builder(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisExtent: height * 0.42),
            itemCount: itemProvider.listData.take(12).length,
            itemBuilder: (context, index) {
              final data = itemProvider.listData[index];
              return ChangeNotifierProvider.value(
                value: data,
                child: CardWidget(index),
              );
            },
          ),
        ],
      ),
    );
  }
}
