import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shopping_app/controller/cart_controller.dart';
import 'package:shopping_app/modal/product_modal.dart';
import 'package:shopping_app/widgets/cart_product.dart';
import 'package:shopping_app/widgets/product_tile.dart';

class CartScreen extends StatelessWidget {
  final CartController cartController = Get.put(CartController());
  CartScreen(this.product);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return GridView.builder(
                itemCount: cartController.cartList.length,
                itemBuilder: (context, index) {
                  return CartProductTile(cartController.cartList[index]);
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                ),
              );
            }),
          ),
        ],
      ),
      bottomSheet: Container(
        color: Theme.of(context).primaryColor,
        height: 70,
        width: double.infinity,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GetX<CartController>(
              builder: (controller) {
                return Text(
                  'Total Amount :' +
                      cartController.totalPrice.toString() +
                      '\$',
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
