import 'package:ecommerce/widgets/cart_Item.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/provider/cart_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartItemList extends ConsumerWidget {
  const CartItemList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartValues = ref.read(cartProvider);

    return ListView.builder(
      itemCount: cartValues.length,
      itemBuilder: (ctx, index) => CartItem(product: cartValues[index].product),
    );
  }
}
