import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:shopping_app/controller/cart_controller.dart';
import 'package:shopping_app/controller/product_controller.dart';
import 'package:get/state_manager.dart';
import 'package:shopping_app/screens/cart_screen.dart';
import 'package:shopping_app/screens/product_tile.dart';

class HomePage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  final CartController cartController = Get.put(CartController());
  final snackBar = const SnackBar(
      content: Text(
        'Cart is empty !',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16.0),
      ),
      duration: Duration(seconds: 1),
      backgroundColor: Colors.black87);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const Icon(
          Icons.account_balance_wallet_sharp,
        ),
        actions: [
          Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.shopping_cart,
                ),
                onPressed: () {
                  if (cartController.cartList.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else {
                    Get.to(CartScreen(cartController.cartList[0]));
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: GetX<CartController>(
                  builder: (controller) {
                    return Text(
                      cartController.cartList.length.toString(),
                      style: const TextStyle(fontSize: 18),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'ShopX',
                    style: TextStyle(
                        fontFamily: 'avenir',
                        fontSize: 32,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                IconButton(
                    icon: const Icon(Icons.view_list_rounded),
                    onPressed: () {}),
                IconButton(icon: const Icon(Icons.grid_view), onPressed: () {}),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              if (productController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return GridView.builder(
                  itemCount: productController.productList.length,
                  itemBuilder: (context, index) {
                    return ProductTile(productController.productList[index]);
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 5.0,
                  ),
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
