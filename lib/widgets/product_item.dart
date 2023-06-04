import 'package:ecommerce/model/product.dart';
import 'package:ecommerce/widgets/rating_stars.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key, required this.product}) : super(key: key);

  final Product product;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8),
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
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 8,
                ),
                Text(
                  product.title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const SizedBox(
                  height: 8,
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
                  height: 16,
                ),
                RatingStars(
                  product: product,
                ),
                const SizedBox(
                  height: 8,
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
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite_border),
              ),
              const SizedBox(height: 45,),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add,
                    color: Colors.green,
                  ),),
            ],
          ),
        ],
      ),
    );
  }
}
