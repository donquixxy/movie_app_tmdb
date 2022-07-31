import 'package:flutter/cupertino.dart';
import 'package:movie_app_tmdb/presentation/widget/card_widget.dart';
import 'package:movie_app_tmdb/view_model/movie_provider.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Popular Movies',
              style: TextStyle(fontSize: 24),
            ),
          ),
          SizedBox(
            height: height * 0.41,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: movieProvider.movieModels!.results.length,
              itemBuilder: (BuildContext context, int index) {
                final data = movieProvider.movieModels!.results[index];
                return CardWidget(data);
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
            child: Text(
              'Popular TV Series',
              style: TextStyle(fontSize: 24),
            ),
          ),
          SizedBox(
            height: height * 0.41,
            child: ListView.builder(
              reverse: true,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: movieProvider.movieModels!.results.length,
              itemBuilder: (BuildContext context, int index) {
                final data = movieProvider.movieModels!.results[index];
                return CardWidget(data);
              },
            ),
          ),
        ],
      ),
    );
  }
}
