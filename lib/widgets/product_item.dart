import 'package:ecommerce/model/product.dart';
import 'package:ecommerce/provider/cart_provider.dart';
import 'package:ecommerce/widgets/rating_stars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecommerce/provider/favorites_provider.dart';

class ProductItem extends ConsumerStatefulWidget {
  const ProductItem(
      {Key? key, required this.product})
      : super(key: key);

  final Product product;

  @override
  ConsumerState<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends ConsumerState<ProductItem> {
  @override
  Widget build(BuildContext context) {
    final favoriteList = ref.watch(favoriteProvider);
    final isFav = favoriteList.contains(widget.product);

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
                child: Image.asset(
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
                  if (!isFav){
                    final bool wasAdded = ref.read(favoriteProvider.notifier).onClickFavorite(widget.product);

                    if (wasAdded) {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Added to favorites"),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Already Added to favorites"),
                        ),
                      );
                    }
                  } else if (isFav) {
                    final bool wasRemoved = ref.read(favoriteProvider.notifier).onUnclickFavIcon(widget.product);

                    if (wasRemoved) {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Removed from Favorites"),
                        ),
                      );
                    }
                  }

                },
                icon: Icon(
                  !isFav
                      ? Icons.favorite_border
                      : Icons.favorite,
                  color: isFav? Colors.red: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              IconButton(
                onPressed: () {
                  final wasAdded = ref.read(cartProvider.notifier).addToCart(widget.product);

                  if (wasAdded) {
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Added To Cart"),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Already in Cart"),
                      ),
                    );
                  }
                },
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
