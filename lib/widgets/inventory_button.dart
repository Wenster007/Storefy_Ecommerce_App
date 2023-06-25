import 'package:ecommerce/model/cart.dart';
import 'package:ecommerce/model/product.dart';
import 'package:ecommerce/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InventoryButton extends ConsumerStatefulWidget {
  final Product product;

  const InventoryButton({super.key, required this.product});

  @override
  InventoryButtonState createState() => InventoryButtonState();
}

class InventoryButtonState extends ConsumerState<InventoryButton> {
  late final  List<Cart> currentCartList;
  int itemsValue = 1; //initial value of the item
  int inventoryCount = 0;// the total number of inventory available.

  void getCurrentInventoryItem() {
    for (var cartItem in currentCartList) {
      if (cartItem.product == widget.product){
        itemsValue = cartItem.quantity;
      }
    }
  }

  @override
  void initState() {
    super.initState();
    currentCartList = ref.read(cartProvider);
    getCurrentInventoryItem();
    inventoryCount = widget.product.inventory;
  }




  void increaseInventory() {
    setState(() {
      if (itemsValue < inventoryCount){
        itemsValue++;
      }
    });
  }

  void decreaseInventory() {
    setState(() {
      if (itemsValue > 0) {
        itemsValue--;
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.scale(
          scale: 0.7,
          child: TextButton(
            onPressed: () {
              decreaseInventory();
              ref.read(cartProvider.notifier).updateCartItemQuantity(widget.product, itemsValue);
            },
            style: TextButton.styleFrom(padding: const EdgeInsets.all(2)),
            child: const Icon(Icons.remove),
          ),
        ),
        Text('$itemsValue'),
        Transform.scale(
          scale: 0.7,
          child: TextButton(
            onPressed: () {
              increaseInventory();
              ref.read(cartProvider.notifier).updateCartItemQuantity(widget.product, itemsValue);
            },
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
