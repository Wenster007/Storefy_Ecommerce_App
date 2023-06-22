import 'package:ecommerce/provider/favorites_provider.dart';
import 'package:ecommerce/widgets/product_item_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteScreen extends ConsumerWidget {
  FavoriteScreen({Key? key}) : super(key: key);


  // void onUnclickFavIcon(Product product) {
  //   favorites.remove(product);
  //
  //   setState(() {
  //     favBody = ProductItemList(
  //       currentDataList: favorites,
  //       colorOfFavoriteIcon: Colors.red,
  //     );
  //   });
  //
  //   ScaffoldMessenger.of(context).clearSnackBars();
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     const SnackBar(
  //       content: Text("Removed from the favorite list"),
  //     ),
  //   );
  // }

  late Widget favBody;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currFavorites = ref.watch(favoriteProvider);
    favBody = ProductItemList(
      currentDataList: currFavorites,
      colorOfFavoriteIcon: Colors.red,
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
