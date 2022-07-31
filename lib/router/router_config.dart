import 'package:flutter/material.dart';
import 'package:movie_app_tmdb/presentation/screen/detail_screen.dart';
import 'package:movie_app_tmdb/presentation/screen/home_screen.dart';
import 'router_name.dart' as route;

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case route.homeRoute:
      return MaterialPageRoute(builder: (context) => HomeScreen());
    case route.detailRoute:
      return MaterialPageRoute(builder: (context) => DetailScreen());
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: Center(
            child: Text("NO ROUTE FOUND"),
          ),
        ),
      );
  }
}
