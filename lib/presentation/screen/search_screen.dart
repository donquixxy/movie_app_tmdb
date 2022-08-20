import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movie_app_tmdb/get_locator.dart';
import 'package:movie_app_tmdb/models/movie_models.dart';
import 'package:movie_app_tmdb/models/result_object.dart';
import 'package:movie_app_tmdb/router/navigation_service.dart';
import 'package:movie_app_tmdb/router/router_name.dart';
import 'package:movie_app_tmdb/view_model/search_provider.dart';
import 'package:provider/provider.dart';

class ResultSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    final itemProvider = Provider.of<SearchProviderResults>(context);

    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
      IconButton(
        onPressed: () async {
          await itemProvider.searchWithQuery(query);
        },
        icon: const Icon(Icons.search),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return BackButton(
      onPressed: () {
        getInstance<NavigationService>().getBack();
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Consumer<SearchProviderResults>(
      builder: (context, value, child) {
        return ListView.builder(
          itemCount: value.movieModelsSearch!.results.length,
          itemBuilder: (context, index) {
            Results data = value.movieModelsSearch!.results[index];
            return ListTile(
              onTap: () {
                getInstance<NavigationService>()
                    .navigateTo(detailRoute, arguments: data);
              },
              title: Text(data.title),
            );
          },
        );
      },
    );
    // return ListView.builder(
    //   itemCount: itemProvider.movieModelsSearch!.results.length,
    //   itemBuilder: (context, index) {
    //     log(itemProvider.movieModelsSearch!.results.length.toString());
    //     var data = itemProvider.movieModelsSearch!.results[index];
    //     return ListTile(
    //       onTap: () {
    //         getInstance<NavigationService>()
    //             .navigateTo(detailRoute, arguments: data);
    //       },
    //       title: Text(data.title),
    //     );
    //   },
    // );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Consumer<SearchProviderResults>(
      builder: (context, value, child) {
        return FutureBuilder(
          future: value.searchWithQuery(query),
          builder:
              (BuildContext context, AsyncSnapshot<MovieModels?> snapshot) {
            var snapshotData = snapshot.data;
            log('run ');
            if (snapshotData == null) {
              return SizedBox();
            }
            return ListView.builder(
              itemCount: snapshotData.results.length,
              itemBuilder: (BuildContext context, int index) {
                Results results = snapshotData.results[index];
                return ListTile(
                  title: Text(results.title),
                );
              },
            );
          },
        );
      },
    );
    // final provider = Provider.of<SearchProviderResults>(context);
    // return FutureBuilder<MovieModels?>(
    //   initialData: null,
    //   future: provider.searchWithQuery(query),
    //   builder: (context, AsyncSnapshot<MovieModels?> snapshot) {
    //     var resultSnapshot = snapshot.data;
    //     if (!snapshot.hasData) {
    //       return const Center(
    //         child: Text(
    //           "Search for movie  . . ",
    //           style: TextStyle(fontSize: 18, color: Colors.white),
    //         ),
    //       );
    //     }
    //     return ListView.builder(
    //       itemCount: resultSnapshot!.results.length,
    //       itemBuilder: (context, index) {
    //         var data = resultSnapshot.results[index];
    //         return ListTile(
    //           onTap: () {
    //             getInstance<NavigationService>()
    //                 .navigateTo(detailRoute, arguments: data);
    //           },
    //           title: Text(data.title),
    //         );
    //       },
    //     );
    //   },
    // );
  }
}
