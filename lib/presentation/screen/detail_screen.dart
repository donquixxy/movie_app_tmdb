import 'package:flutter/material.dart';
import 'package:movie_app_tmdb/models/result_object.dart';
import 'package:movie_app_tmdb/presentation/widget/stack_widget.dart';
import 'package:movie_app_tmdb/view_model/result_provider.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  final Results data;
  const DetailScreen(this.data);

  @override
  Widget build(BuildContext context) {
    // var data = Provider.of<ResultProvider>(context, listen: false)
    //     .getDataByIndex(index);
    return Scaffold(
      body: ChangeNotifierProvider.value(
        value: data,
        child: StackWidget(),
      ),
    );
  }
}
