import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:shopping_app/controller/product_controller.dart';
import 'package:shopping_app/modal/product_modal.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  ProductTile(this.product);
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Card(
      // elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 100,
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Image.network(
                    product.thumbnailUrl,
                    // fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Obx(
                    () => CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: product.isFavorite.value
                            ? Icon(Icons.favorite_rounded)
                            : Icon(Icons.favorite_border),
                        onPressed: () {
                          product.isFavorite.toggle();
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 8),
            Text(
              product.albumId.toString(),
              maxLines: 2,
              style:
                  TextStyle(fontFamily: 'avenir', fontWeight: FontWeight.w800),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 8),
            SizedBox(height: 8),
            Text('\$${product.id}',
                style: TextStyle(fontSize: 32, fontFamily: 'avenir')),
          ],
        ),
      ),
    );
  }
}
