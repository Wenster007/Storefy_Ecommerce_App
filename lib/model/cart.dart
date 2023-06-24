import 'package:ecommerce/model/product.dart';

class Cart {
  final Product product;
  int quantity ;

  Cart(this.product, this.quantity);
}