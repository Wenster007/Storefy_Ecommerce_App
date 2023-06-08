import 'package:ecommerce/widgets/product_item_list.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/data/dummy_data.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Favorites",
          style: TextStyle(color: Colors.green, fontSize: 25),
        ),
      ),
      body: ProductItemList(
        currentDataList: favorites,
        colorOfFavoriteIcon: Colors.red,
      ),
    );
  }
}
