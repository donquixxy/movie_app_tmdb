import 'package:flutter/material.dart';
import 'package:movie_app_tmdb/presentation/widget/stack_widget.dart';
import 'package:movie_app_tmdb/view_model/result_provider.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  final int idArguments;
  const DetailScreen(this.idArguments);

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<ResultProvider>(context, listen: false)
        .getDataById(idArguments);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Details"),
      ),
      body: ChangeNotifierProvider.value(
        value: data,
        child: StackWidget(),
      ),
    );
  }
}
