import 'package:ecommerce/model/cart.dart';
import 'package:ecommerce/model/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartNotifier extends StateNotifier<List<Cart>>{
  CartNotifier() : super([]);

  bool addToCart(Product product) {
    bool isProductInCart(List<Cart> cartList, Product targetProduct) {
      bool result;
      for (var cart in cartList) {
        if (cart.product == targetProduct) {
          result = true;
          return result;
        }
      }
      return false;
    }

    final bool isPresent = isProductInCart(state, product);

    if (isPresent) {
      return false;
    } else {
      Cart newCartItem = Cart(product, 1);
      state = [...state, newCartItem];

      return true;
    }
  }

  int getTotal() {
    int total = 0;

    for (int i=0; i<state.length; i++) {
      total = total + (state[i].product.price * state[i].quantity);
    }

    return total;
  }


  //for changing the quantity based on the InventoryButton in cartItem.
  void updateCartItemQuantity(Product product,int newQuantity) {
    state = state.where((element) => element.product != product).toList();
    final myCartItem = Cart(product, newQuantity);
    state = [...state, myCartItem];

  }

}

final cartProvider = StateNotifierProvider<CartNotifier, List<Cart>>((ref) => CartNotifier());