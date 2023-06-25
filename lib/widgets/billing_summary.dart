import 'package:ecommerce/model/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecommerce/provider/cart_provider.dart';

class BillingSummary extends ConsumerWidget {
  const BillingSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    int getTotal(List<Cart> listOfCart) {
      int total = 0;
      for (var cartItem in listOfCart) {
        total = total + (cartItem.product.price * cartItem.quantity);
      }
      return total;
    }

    final listOfCart = ref.watch(cartProvider);
    int shipping = 5;
    int discount = 0;
    int tax = 3;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Billing Summary",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              const Text(
                  "------------------------------------------------------------------------------"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Subtotal"),
                  Text("\$${getTotal(listOfCart)}",style: const TextStyle(fontWeight: FontWeight.w600),)
                ],
              ),
              const SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Discount"),
                  Text("-\$$discount",style: const TextStyle(fontWeight: FontWeight.w600),),
                ],
              ),
              const SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Shipping"),
                  Text("\$$shipping",style: const TextStyle(fontWeight: FontWeight.w600),),
                ],
              ),
              const SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Tax"),
                  Text("\$$tax",style: const TextStyle(fontWeight: FontWeight.w600),),
                ],
              ),
              const Text(
                  "-------------------------------------------------------------------------------"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Grand Total", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                  Text("\$${getTotal(listOfCart) - discount + shipping + tax}", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                ],
              ),

            ],
          )),
    );
  }
}
