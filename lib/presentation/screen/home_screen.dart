import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movie_app_tmdb/models/result_object.dart';
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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 26,
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var box = Hive.box<Results>('favorites');
          print(box.getAt(0));
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        currentIndex: homeProvider.currentIndex,
        onTap: homeProvider.changeCurrentIndex,
        items: homeProvider.bottomItem,
      ),
      body: itemProvider.listData.isEmpty
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : Consumer<HomeProvider>(
              builder: ((context, value, child) {
                return IndexedStack(
                  index: value.currentIndex,
                  children: [HomeWidget(), FavoriteScreen()],
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
