import 'package:ecommerce/widgets/cartItem.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/data/dummy_data.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cart",
          style: TextStyle(color: Colors.green),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Order Review",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const Text(
              "2 Items in Cart",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            CartItem(product: dummyData[0]),
          ],
        ),
      ),
    );
  }
}
