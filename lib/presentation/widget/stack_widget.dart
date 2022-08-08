import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_tmdb/constants.dart';
import 'package:movie_app_tmdb/get_locator.dart';
import 'package:movie_app_tmdb/models/result_object.dart';
import 'package:movie_app_tmdb/presentation/widget/bottom_details_widget.dart';
import 'package:movie_app_tmdb/router/navigation_service.dart';
import 'package:provider/provider.dart';

class StackWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var heightScreen = MediaQuery.of(context).size.height;
    var widthScreen = MediaQuery.of(context).size.width;
    final itemProvider = Provider.of<Results>(context);
    return SafeArea(
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Stack(
            children: [
              ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 3),
                child: CachedNetworkImage(
                  imageUrl: posterPath + itemProvider.backdrop_path,
                  fit: BoxFit.fill,
                  height: heightScreen * 0.5,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(18),
                height: heightScreen * 0.38,
                width: double.infinity,
                margin: EdgeInsets.only(top: heightScreen * 0.30),
                child: Card(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        height: 20,
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
                      const SizedBox(
                        height: 50,
                      ),
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
                                  primary: Color.fromARGB(255, 0, 204, 113)),
                              onPressed: () {},
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
                left: widthScreen * 0.10,
                bottom: heightScreen * 0.12,
                child: CachedNetworkImage(
                    height: 200,
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
