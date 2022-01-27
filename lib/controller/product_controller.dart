import 'package:get/state_manager.dart';
import 'package:shopping_app/modal/product_modal.dart';
import 'package:shopping_app/network/netork.dart';

class ProductController extends GetxController {
  final productList = [].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchProduct();
    print(productList);
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
