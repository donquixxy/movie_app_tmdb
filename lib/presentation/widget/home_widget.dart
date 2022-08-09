import 'package:flutter/material.dart';
import 'package:movie_app_tmdb/presentation/widget/card_widget.dart';
import 'package:movie_app_tmdb/view_model/result_provider.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final itemProvider = Provider.of<ResultProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
            child: Text(
              'Popular TV Series',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          SizedBox(
            height: height * 0.41,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: itemProvider.listData.length,
              itemBuilder: (BuildContext context, int index) {
                final data = itemProvider.listData[index];
                return ChangeNotifierProvider.value(
                  value: data,
                  child: CardWidget(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
