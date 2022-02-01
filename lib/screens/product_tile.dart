import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:shopping_app/controller/cart_controller.dart';
import 'package:shopping_app/controller/product_controller.dart';
import 'package:shopping_app/modal/product_modal.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  ProductTile(this.product);
  final ProductController productController = Get.put(ProductController());
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Image.network(
                        product.thumbnailUrl,
                        fit: BoxFit.cover,
                        frameBuilder:
                            (context, child, frame, wasSynchronouslyLoaded) {
                          return child;
                        },
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        },
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: Obx(
                        () => CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: IconButton(
                            icon: product.isFavorite.value
                                ? const Icon(Icons.favorite_rounded)
                                : const Icon(Icons.favorite_border),
                            onPressed: () {
                              product.isFavorite.toggle();
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text('\$${product.id}',
                        style: const TextStyle(fontSize: 16)),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () {
                      cartController.addToCart(product);
                    },
                    child: const Text('Buy', style: TextStyle(fontSize: 14)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
