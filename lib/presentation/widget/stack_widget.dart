import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_tmdb/constants.dart';
import 'package:movie_app_tmdb/models/result_object.dart';
import 'package:provider/provider.dart';

class StackWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final itemProvider = Provider.of<Results>(context);
    return Container(
      color: Colors.black,
      width: 300,
      height: 300,
      child: Stack(
        children: [
          Positioned(
            child: CachedNetworkImage(
              imageUrl: posterPath + itemProvider.poster_path,
            ),
          ),
          Text(itemProvider.title),
          Positioned(
            child: Text(
              itemProvider.vote_average.toString(),
            ),
          )
        ],
      ),
    );
  }
}
