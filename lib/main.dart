import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
