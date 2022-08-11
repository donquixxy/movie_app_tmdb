import 'package:flutter/material.dart';
import 'package:movie_app_tmdb/get_locator.dart';
import 'package:movie_app_tmdb/models/movie_models.dart';
import 'package:movie_app_tmdb/router/navigation_service.dart';
import 'package:movie_app_tmdb/router/router_name.dart';
import 'package:movie_app_tmdb/view_model/result_provider.dart';
import 'package:movie_app_tmdb/view_model/search_provider.dart';
import 'package:provider/provider.dart';

class ResultSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.search),
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
    final itemProvider = Provider.of<SearchProviderResults>(context);
    return ListView.builder(
      itemCount: itemProvider.movieModelsSearch!.results.length,
      itemBuilder: (context, index) {
        print(itemProvider.movieModelsSearch!.results.length);
        var data = itemProvider.movieModelsSearch!.results[index];
        return ListTile(
          title: Text(data.title),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final provider = Provider.of<SearchProviderResults>(context);
    return FutureBuilder(
      future: provider.searchWithQuery(query),
      builder: (context, AsyncSnapshot<MovieModels?> snapshot) {
        var dataModels = snapshot.data;
        if (!snapshot.hasData) {
          return const Center(
            child: Text(
              "Search for movie  . . ",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          );
        }
        return ListView.builder(
          itemCount: provider.movieModelsSearch!.results.length,
          itemBuilder: (context, index) {
            var data = provider.movieModelsSearch!.results[index];
            return ListTile(
              onTap: () {
                getInstance<NavigationService>()
                    .navigateTo(detailRoute, arguments: data);
                ;
              },
              title: Text(data.title),
            );
          },
        );
      },
    );
  }
}
