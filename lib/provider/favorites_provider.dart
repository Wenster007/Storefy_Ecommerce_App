import 'package:ecommerce/model/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteNotifier extends StateNotifier<List<Product>>{
  FavoriteNotifier() : super([]);

  bool onClickFavorite(Product product) {
    bool doesContains = state.contains(product);

    if (!doesContains) {
      state = [...state, product];
      print(state);
      return true;
    }
    return false;
  }

  bool onUnclickFavIcon (Product product) {
    bool doesContains = state.contains(product);

    if (doesContains) {
      state = state.where((p) => p.title != product.title).toList();
      return true;
    }
    return false;
  }

}

final favoriteProvider = StateNotifierProvider<FavoriteNotifier, List<Product>>((ref) => FavoriteNotifier());