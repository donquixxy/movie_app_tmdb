import 'package:flutter/material.dart';
import 'package:movie_app_tmdb/models/result_object.dart';
import 'package:movie_app_tmdb/view_model/result_provider.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<ResultProvider>(context, listen: false);
    // var data2 = Provider.of<Results>(context, listen: false);

    // print(Provider.of<Results>(context));
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
      ),
      body: ListView(
        children: [
          TextButton(
              onPressed: () {
                print(data);
              },
              child: const Text("OK"))
        ],
      ),
    );
  }
}
