import 'package:get/state_manager.dart';
import 'package:shopping_app/modal/product_modal.dart';
import 'package:shopping_app/network/network.dart';

class ProductController extends GetxController {
  final productList = <Product>[].obs;
  var isLoading = true.obs;
  final favProductList = <Product>[].obs;

  @override
  void onInit() {
    fetchProduct();
    super.onInit();
  }

  void fetchProduct() async {
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
