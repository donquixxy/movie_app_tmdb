import 'package:flutter/material.dart';
import 'package:movie_app_tmdb/presentation/screen/favorite_screen.dart';
import 'package:movie_app_tmdb/presentation/widget/home_widget.dart';
import 'package:movie_app_tmdb/view_model/home_screen_provider.dart';
import 'package:movie_app_tmdb/view_model/result_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    final itemProvider = Provider.of<ResultProvider>(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        currentIndex: homeProvider.currentIndex,
        onTap: homeProvider.changeCurrentIndex,
        items: homeProvider.bottomItem,
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: itemProvider.listData.isEmpty
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : Consumer<HomeProvider>(
              builder: ((context, value, child) {
                return IndexedStack(
                  index: value.currentIndex,
                  children: [HomeWidget(), const FavoriteScreen()],
                );
              }),
            ),
    );
  }

  @override
  void initState() {
    context.read<ResultProvider>().fetchAllMovie();
    super.initState();
  }
}
