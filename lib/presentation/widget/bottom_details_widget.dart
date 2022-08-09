import 'package:flutter/material.dart';
import 'package:movie_app_tmdb/models/result_object.dart';
import 'package:provider/provider.dart';

class BottomDetailsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var widthScreen = MediaQuery.of(context).size.width;
    var itemProvider = Provider.of<Results>(context, listen: false);
    return Container(
      padding: const EdgeInsets.only(left: 18, right: 18),
      width: widthScreen,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Overview',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            itemProvider.overview,
            style: const TextStyle(fontSize: 18, color: Colors.white),
          )
        ],
      ),
    );
  }
}
