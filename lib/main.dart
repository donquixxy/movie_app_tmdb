import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_tmdb/get_locator.dart';
import 'package:movie_app_tmdb/models/result_object.dart';
import 'package:movie_app_tmdb/presentation/screen/home_screen.dart';
import 'package:movie_app_tmdb/router/navigation_service.dart';
import 'package:movie_app_tmdb/router/router_config.dart';
import 'package:movie_app_tmdb/view_model/favorite_provider.dart';
import 'package:movie_app_tmdb/view_model/home_screen_provider.dart';
import 'package:movie_app_tmdb/view_model/result_provider.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetLocator();
  Hive.registerAdapter(ResultsAdapter());
  await Hive.initFlutter();
  await Hive.openBox<Results>('favorites');
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ResultProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FavoriteProvider(),
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.roboto().fontFamily,
        canvasColor: const Color.fromARGB(255, 14, 31, 48),
        brightness: Brightness.dark,
        textSelectionTheme:
            const TextSelectionThemeData(selectionColor: Colors.white),
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.black),
          bodyText2: TextStyle(color: Colors.black),
        ),
      ),
      navigatorKey: getInstance<NavigationService>().navigatorKey,
      onGenerateRoute: generateRoute,
      home: HomeScreen(),
    );
  }
}
