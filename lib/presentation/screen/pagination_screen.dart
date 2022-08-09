import 'package:flutter/material.dart';
import 'package:movie_app_tmdb/get_locator.dart';
import 'package:movie_app_tmdb/presentation/widget/favorite_card_widget.dart';
import 'package:movie_app_tmdb/router/navigation_service.dart';
import 'package:movie_app_tmdb/router/router_name.dart';
import 'package:movie_app_tmdb/view_model/result_provider.dart';
import 'package:provider/provider.dart';

class PaginationScreen extends StatefulWidget {
  @override
  State<PaginationScreen> createState() => _PaginationScreenState();
}

class _PaginationScreenState extends State<PaginationScreen> {
  var scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var itemProvider = context.watch<ResultProvider>();

    return Scaffold(
      body: SafeArea(
        child: itemProvider.listData.isEmpty
            ? const Center(child: CircularProgressIndicator.adaptive())
            : ListView.builder(
                padding: const EdgeInsets.all(12),
                controller: scrollController,
                itemCount: itemProvider.listData.length,
                itemBuilder: (BuildContext context, int index) {
                  var data = itemProvider.listData[index];
                  return ChangeNotifierProvider.value(
                    value: data,
                    child: GestureDetector(
                        onTap: () {
                          getInstance<NavigationService>()
                              .navigateTo(detailRoute, arguments: index);
                        },
                        child: FavoriteCard(index)),
                  );
                },
              ),
      ),
    );
  }

  @override
  void initState() {
    context.read<ResultProvider>().fetchSomeMoreData();
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        context.read<ResultProvider>().fetchSomeMoreData();
      }
    });
    super.initState();
  }
}
