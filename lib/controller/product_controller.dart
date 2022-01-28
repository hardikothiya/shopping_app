import 'package:get/state_manager.dart';
import 'package:shopping_app/modal/product_modal.dart';
import 'package:shopping_app/network/network.dart';

class ProductController extends GetxController {
  final productList = <Product>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchProducts();
    // print(productList);

    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await NetworkService.fetchProducts();
      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}
