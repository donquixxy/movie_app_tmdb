import 'package:flutter/material.dart';
import 'package:movie_app_tmdb/get_locator.dart';
import 'package:movie_app_tmdb/presentation/screen/home_screen.dart';
import 'package:movie_app_tmdb/router/navigation_service.dart';
import 'package:movie_app_tmdb/router/router_config.dart';
import 'package:movie_app_tmdb/view_model/home_screen_provider.dart';
import 'package:movie_app_tmdb/view_model/result_provider.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetLocator();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ResultProvider(),
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
      navigatorKey: getInstance<NavigationService>().navigatorKey,
      onGenerateRoute: generateRoute,
      home: HomeScreen(),
    );
  }
}
