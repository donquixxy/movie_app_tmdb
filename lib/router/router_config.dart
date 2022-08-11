import 'package:flutter/material.dart';
import 'package:movie_app_tmdb/models/result_object.dart';
import 'package:movie_app_tmdb/presentation/screen/detail_screen.dart';
import 'package:movie_app_tmdb/presentation/screen/home_screen.dart';
import 'package:movie_app_tmdb/presentation/screen/pagination_screen.dart';
import 'router_name.dart' as route;

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case route.homeRoute:
      return MaterialPageRoute(
          builder: (context) => HomeScreen(), settings: settings);
    case route.detailRoute:
      return MaterialPageRoute(
        builder: (context) => DetailScreen(settings.arguments as Results),
      );
    case route.paginationRoute:
      return MaterialPageRoute(
        builder: (context) => PaginationScreen(),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(
            child: Text("NO ROUTE FOUND"),
          ),
        ),
      );
  }
}
