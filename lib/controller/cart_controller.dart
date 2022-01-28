import 'package:get/get.dart';
import 'package:shopping_app/modal/product_modal.dart';

class CartController extends GetxController {
  final cartList = <Product>[].obs;

  double get totalPrice => cartList.fold(0, (sum, item) => sum + item.id);

  addToCart(Product product) {
    cartList.add(product);
  }
}
