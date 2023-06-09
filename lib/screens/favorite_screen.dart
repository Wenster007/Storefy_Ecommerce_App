import 'package:ecommerce/model/product.dart';
import 'package:ecommerce/widgets/product_item_list.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/data/dummy_data.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  void onUnclickFavIcon(Product product) {
    favorites.remove(product);

    setState(() {
      favBody = ProductItemList(
        currentDataList: favorites,
        colorOfFavoriteIcon: Colors.red,
        onClickFavIcon: onUnclickFavIcon,
      );
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Removed from the favorite list"),
      ),
    );
  }

  late Widget favBody;

  @override
  Widget build(BuildContext context) {
    favBody = ProductItemList(
      currentDataList: favorites,
      colorOfFavoriteIcon: Colors.red,
      onClickFavIcon: onUnclickFavIcon,
    );

    if (favorites.isEmpty) {
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
