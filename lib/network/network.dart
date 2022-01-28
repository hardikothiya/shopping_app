import 'package:http/http.dart' as http;
import 'package:shopping_app/modal/product_modal.dart';
import 'dart:convert';

class NetworkService {
  static var client = http.Client();

  static Future<List<Product>?> fetchProducts() async {
    var response = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

    if (response.statusCode == 200) {
      String data = response.body;
      print(response.statusCode);
      return productFromJson(data);
    } else {
      return null;
    }
  }
}
