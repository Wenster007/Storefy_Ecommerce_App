import 'package:ecommerce/model/product.dart';
import 'package:ecommerce/widgets/inventory_button.dart';
import 'package:ecommerce/widgets/rating_stars.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  height: 150,
                  width: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.network(
                      product.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                // flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      product.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      product.description,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color.fromARGB(200, 77, 74, 74),
                        height: 1,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    RatingStars(
                      product: product,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      "${product.price}\$",
                      style: const TextStyle(
                          color: Colors.green,
                          fontSize: 24,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
              Column(),
            ],
          ),
          Positioned(bottom: 3, right: -8 , child: InventoryButton(product: product, ))
        ],
      ),
    );
  }
}
