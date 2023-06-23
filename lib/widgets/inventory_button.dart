import 'package:ecommerce/model/product.dart';
import 'package:flutter/material.dart';

class InventoryButton extends StatefulWidget {
  final Product product;

  const InventoryButton({super.key, required this.product});

  @override
  InventoryButtonState createState() => InventoryButtonState();
}

class InventoryButtonState extends State<InventoryButton> {
  int itemsValue = 1;
  int inventoryCount = 0;

  @override
  void initState() {
    super.initState();
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
            onPressed: decreaseInventory,
            child: const Icon(Icons.remove),
            style: TextButton.styleFrom(padding: const EdgeInsets.all(2)),
          ),
        ),
        Text('$itemsValue'),
        Transform.scale(
          scale: 0.7,
          child: TextButton(
            onPressed: increaseInventory,
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
