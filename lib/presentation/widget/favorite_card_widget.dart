import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_tmdb/constants.dart';
import 'package:movie_app_tmdb/models/result_object.dart';
import 'package:provider/provider.dart';

class FavoriteCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final itemProvider = context.read<Results>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.circular(8)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //IMAGE SECTION//
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: posterPath + itemProvider.poster_path,
                    fit: BoxFit.cover,
                    height: screenHeight * 0.18,
                  ),
                ),
              ),
              //IMAGE SECTION//
              Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: screenWidth * 0.5,
                        child: Text(
                          itemProvider.title,
                          maxLines: 5,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        itemProvider.original_language.toUpperCase(),
                        style:
                            const TextStyle(fontSize: 18, color: Colors.grey),
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
