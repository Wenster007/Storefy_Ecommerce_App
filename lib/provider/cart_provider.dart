import 'package:ecommerce/model/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartNotifier extends StateNotifier<List<Product>>{
  CartNotifier() : super([]);

  bool addToCart(Product product) {
    final bool isPresent = state.contains(product);

    if (isPresent) {
      return false;
    } else {
      state = [...state, product];
      return true;
    }
  }

  int getTotal() {
    int total = 0;

    for (int i=0; i<state.length; i++) {
      total = total + state[i].price;
    }

    return total;
  }
}

final cartProvider = StateNotifierProvider<CartNotifier, List<Product>>((ref) => CartNotifier());