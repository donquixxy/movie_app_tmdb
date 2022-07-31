import 'package:get_it/get_it.dart';
import 'package:movie_app_tmdb/router/navigation_service.dart';

final GetIt getInstance = GetIt.instance;

void setupGetLocator() {
  getInstance.registerSingleton<NavigationService>(NavigationService());
}
