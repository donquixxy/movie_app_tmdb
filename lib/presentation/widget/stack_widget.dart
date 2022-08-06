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
    final itemProvider = Provider.of<Results>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: CachedNetworkImage(
                      imageUrl: posterPath + itemProvider.poster_path,
                      fit: BoxFit.cover,
                      height: heightScreen * 0.4,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      cardSmallDetail(Icons.language, 'Language',
                          itemProvider.original_language),
                      const SizedBox(
                        height: 20,
                      ),
                      cardSmallDetail(Icons.date_range, 'Release Date',
                          itemProvider.release_date),
                      const SizedBox(
                        height: 20,
                      ),
                      cardSmallDetail(Icons.star, 'Rating',
                          '${itemProvider.vote_average} / 10'),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  itemProvider.title,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  color: Colors.black,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Overview',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  itemProvider.overview,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
