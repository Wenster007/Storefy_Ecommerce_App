import 'package:ecommerce/widgets/product_item.dart';
import 'package:ecommerce/model/product.dart';
import 'package:flutter/material.dart';

class ProductItemList extends StatelessWidget {
  const ProductItemList({Key? key, required this.currentDataList, required this.colorOfFavoriteIcon})
      : super(key: key);

  final List<Product> currentDataList;
  final Color colorOfFavoriteIcon;


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: currentDataList.length,
      itemBuilder: (ctx, index) => ProductItem(product: currentDataList[index], colorOfFavoriteIcon: colorOfFavoriteIcon),
    );
  }
}
