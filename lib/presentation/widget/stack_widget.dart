import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_tmdb/constants.dart';
import 'package:movie_app_tmdb/models/result_object.dart';

class StackWidget extends StatelessWidget {
  final Results models;

  const StackWidget(this.models);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: 300,
      height: 300,
      child: Stack(
        children: [
          Positioned(
            child: CachedNetworkImage(
              imageUrl: posterPath + models.poster_path,
            ),
          ),
          Text(models.title),
          Positioned(
            child: Text(
              models.vote_average.toString(),
            ),
          )
        ],
      ),
    );
  }
}
