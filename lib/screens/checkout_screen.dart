import 'package:ecommerce/provider/cart_provider.dart';
import 'package:ecommerce/widgets/billing_summary.dart';
import 'package:ecommerce/widgets/cart_item_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CheckOutScreen extends ConsumerWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentCart = ref.watch(cartProvider);

    Widget cartBody = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          const Text(
            "Order Review",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text(
            "${currentCart.length} Items in Cart",
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
          const Expanded(child: CartItemList()),
          const Expanded(child: BillingSummary()),
        ],
      ),
    );

    if (currentCart.isEmpty) {
      cartBody = const Center(child: Text("The Cart Is Empty"),);
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cart",
          style: TextStyle(color: Colors.green, fontSize: 25),
        ),
      ),
      body: cartBody,
    );
  }
}
