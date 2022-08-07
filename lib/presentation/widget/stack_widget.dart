import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_tmdb/constants.dart';
import 'package:movie_app_tmdb/models/result_object.dart';
import 'package:movie_app_tmdb/presentation/widget/card_small_detail.dart';
import 'package:provider/provider.dart';

class StackWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var heightScreen = MediaQuery.of(context).size.height;
    var widthScreen = MediaQuery.of(context).size.width;
    final itemProvider = Provider.of<Results>(context);
    return SafeArea(
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: posterPath + itemProvider.backdrop_path,
            fit: BoxFit.fill,
            height: heightScreen * 0.5,
            placeholder: (context, url) => CircularProgressIndicator(),
          ),
          Container(
            padding: EdgeInsets.all(18),
            height: heightScreen * 0.4,
            width: double.infinity,
            margin: EdgeInsets.only(top: heightScreen * 0.26),
            child: Card(
              color: Colors.white,
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: widthScreen * 0.4,
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        child: Text(
                          itemProvider.title,
                          maxLines: 10,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        width: widthScreen * 0.15,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: widthScreen * 0.4,
                      ),
                      Text(
                        itemProvider.release_date,
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                      SizedBox(
                        width: widthScreen * 0.15,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: widthScreen * 0.10,
            bottom: heightScreen * 0.15,
            child: CachedNetworkImage(
                height: 200,
                imageUrl: posterPath + itemProvider.poster_path,
                fit: BoxFit.cover,
                placeholder: (context, url) => CircularProgressIndicator()),
          ),
          Positioned(
            top: heightScreen * 0.26,
            right: 20,
            child: Card(
              color: Colors.yellow[800],
              child: SizedBox(
                width: 60,
                child: Column(children: [
                  const Text(
                    'Score',
                    style: TextStyle(color: Colors.white70, fontSize: 18),
                  ),
                  Text(
                    itemProvider.vote_average.toString(),
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70),
                  ),
                ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
