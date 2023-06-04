import 'package:ecommerce/model/product.dart';
import 'package:flutter/material.dart';


class RatingStars extends StatelessWidget {
  const RatingStars({Key? key, required this.product}) : super(key: key);

  final Product product;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        5,
            (index) => Icon(
          Icons.star,
          color: index < product.rating ? Colors.amber : Colors.grey,
              size: 15,
        ),
      ),
    );
  }
}
