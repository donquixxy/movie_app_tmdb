import 'package:flutter/material.dart';
import 'package:movie_app_tmdb/presentation/home_screen.dart';
import 'package:movie_app_tmdb/router/router_config.dart';
import 'package:movie_app_tmdb/view_model/home_screen_provider.dart';
import 'package:movie_app_tmdb/view_model/movie_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MovieProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        )
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: generateRoute,
      home: HomeScreen(),
    );
  }
}
