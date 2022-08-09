import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_tmdb/constants.dart';
import 'package:movie_app_tmdb/get_locator.dart';
import 'package:movie_app_tmdb/models/result_object.dart';
import 'package:movie_app_tmdb/presentation/widget/bottom_details_widget.dart';
import 'package:movie_app_tmdb/router/navigation_service.dart';
import 'package:movie_app_tmdb/view_model/favorite_provider.dart';
import 'package:provider/provider.dart';

class StackWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;
    final itemProvider = Provider.of<Results>(context, listen: false);
    final favoriteProvier = context.watch<FavoriteProvider>();
    return SafeArea(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Stack(
            children: [
              ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 3),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8)),
                  child: CachedNetworkImage(
                    imageUrl: posterPath + itemProvider.backdrop_path,
                    fit: BoxFit.fill,
                    height: heightScreen * 0.5,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(18),
                height: heightScreen * 0.4,
                width: double.infinity,
                margin: EdgeInsets.only(top: heightScreen * 0.30),
                child: Card(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //SPACING ATAS TITLE
                      const SizedBox(
                        height: 20,
                      ),
                      //CONTENT
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

                      Row(
                        children: [
                          SizedBox(
                            width: widthScreen * 0.4,
                          ),
                          Text(
                            itemProvider.release_date,
                            style: const TextStyle(
                                fontSize: 15, color: Colors.grey),
                          ),
                          SizedBox(
                            width: widthScreen * 0.15,
                          ),
                        ],
                      ),
                      //SPACING ANTAR BUTTON DAN TITLE
                      SizedBox(
                        height: heightScreen * 0.09,
                      ),
                      //END OF CONTENT
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: widthScreen * 0.25,
                          ),
                          SizedBox(
                            height: 50,
                            width: widthScreen * 0.4,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  primary:
                                      const Color.fromARGB(255, 0, 204, 113)),
                              onPressed: () {
                                favoriteProvier.addToFavoriteBox(itemProvider);
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: const [
                                  Icon(
                                    Icons.favorite,
                                    color: Colors.white,
                                  ),
                                  Text('Add To Favorite')
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: widthScreen * 0.2,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: widthScreen * 0.1,
                top: heightScreen * 0.31,
                child: CachedNetworkImage(
                    height: heightScreen * 0.27,
                    imageUrl: posterPath + itemProvider.poster_path,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator()),
              ),
              Positioned(
                top: heightScreen * 0.3,
                right: 20,
                child: Card(
                  color: Colors.yellow[800],
                  child: SizedBox(
                    width: 60,
                    child: Column(
                      children: [
                        const Text(
                          'Score',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Text(
                          itemProvider.vote_average.toString(),
                          style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    getInstance<NavigationService>().getBack();
                  },
                ),
              ),
            ],
          ),
          BottomDetailsWidget(),
        ],
      ),
    );
  }
}
