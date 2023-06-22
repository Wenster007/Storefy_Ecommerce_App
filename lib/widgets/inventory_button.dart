import 'package:ecommerce/model/product.dart';
import 'package:flutter/material.dart';

class InventoryButton extends StatefulWidget {
  final Product product;

  const InventoryButton({super.key, required this.product});

  @override
  InventoryButtonState createState() => InventoryButtonState();
}

class InventoryButtonState extends State<InventoryButton> {
  int inventoryCount = 0;

  @override
  void initState() {
    super.initState();
    inventoryCount = widget.product.inventory;
  }

  void increaseInventory() {
    setState(() {
      inventoryCount++;
      widget.product.inventory = inventoryCount;
    });
  }

  void decreaseInventory() {
    setState(() {
      if (inventoryCount > 0) {
        inventoryCount--;
        widget.product.inventory = inventoryCount;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.scale(
          scale: 0.4,
          child: ElevatedButton(
            onPressed: decreaseInventory,
            child: const Icon(Icons.remove),
          ),
        ),
        Text('$inventoryCount'),
        Transform.scale(
          scale: 0.4,
          child: ElevatedButton(
            onPressed: increaseInventory,
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
