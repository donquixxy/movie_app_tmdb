import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_tmdb/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movie_app_tmdb/get_locator.dart';
import 'package:movie_app_tmdb/models/result_object.dart';
import 'package:movie_app_tmdb/router/navigation_service.dart';
import 'package:movie_app_tmdb/router/router_name.dart' as route;
import 'package:provider/provider.dart';

class CardWidget extends StatelessWidget {
  final int index;
  const CardWidget(this.index);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    var item = Provider.of<Results>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 10, 12, 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              // favoriteProvier.compareObject(item);
              getInstance<NavigationService>()
                  .navigateTo(route.detailRoute, arguments: item);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: item.poster_path!.isNotEmpty
                    ? posterPath + item.poster_path!
                    : noPosterUrl,
                fit: BoxFit.cover,
                width: width * 0.4,
                progressIndicatorBuilder: (context, url, downloadProgress) {
                  return Center(
                    child: CircularProgressIndicator(
                      value: downloadProgress.progress,
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            width: width * 0.40,
            child: Text(
              item.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.roboto().fontFamily),
            ),
          )
        ],
      ),
    );
  }
}
