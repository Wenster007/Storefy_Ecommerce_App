import 'package:ecommerce/provider/favorites_provider.dart';
import 'package:ecommerce/widgets/product_item_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteScreen extends ConsumerWidget {
  FavoriteScreen({Key? key}) : super(key: key);

  late Widget favBody;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currFavorites = ref.watch(favoriteProvider);
    favBody = ProductItemList(
      currentDataList: currFavorites,

    );

    if (currFavorites.isEmpty) {
      favBody = const Center(
        child: Text(
          "No Items in the Favorites",
          style: TextStyle(fontSize: 14),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Favorites",
          style: TextStyle(color: Colors.green, fontSize: 25),
        ),
      ),
      body: favBody,
    );
  }
}
