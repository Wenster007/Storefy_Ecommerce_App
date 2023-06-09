import 'package:ecommerce/model/product.dart';
import 'package:ecommerce/widgets/rating_stars.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/data/dummy_data.dart';

class ProductItem extends StatefulWidget {
  const ProductItem(
      {Key? key, required this.product, required this.colorOfFavoriteIcon, required this.onClickFavIcon})
      : super(key: key);

  final Product product;
  final Color colorOfFavoriteIcon;
  final void Function (Product product) onClickFavIcon;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {


  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              height: 150,
              width: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  widget.product.imageUrl,
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
                  widget.product.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  widget.product.description,
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
                  product: widget.product,
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  "${widget.product.price}\$",
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
                onPressed: () {
                  widget.onClickFavIcon(widget.product);
                },
                icon: Icon(
                  widget.colorOfFavoriteIcon != Colors.red
                      ? Icons.favorite_border
                      : Icons.favorite,
                  color: widget.colorOfFavoriteIcon,
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
