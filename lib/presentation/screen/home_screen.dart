import 'package:flutter/material.dart';
import 'package:movie_app_tmdb/presentation/screen/favorite_screen.dart';
import 'package:movie_app_tmdb/presentation/widget/home_widget.dart';
import 'package:movie_app_tmdb/view_model/home_screen_provider.dart';
import 'package:movie_app_tmdb/view_model/movie_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);
    final homeProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        currentIndex: homeProvider.currentIndex,
        onTap: homeProvider.changeCurrentIndex,
        items: homeProvider.bottomItem,
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Consumer<HomeProvider>(
        builder: ((context, value, child) {
          return movieProvider.dataList.isEmpty
              ? const Center(
                  child: CircularProgressIndicator.adaptive(),
                )
              : IndexedStack(
                  index: value.currentIndex,
                  children: [HomeWidget(), FavoriteScreen()],
                );
        }),
      ),
    );
  }

  @override
  void initState() {
    context.read<MovieProvider>().fetchPopularMovie();
    super.initState();
  }
}
