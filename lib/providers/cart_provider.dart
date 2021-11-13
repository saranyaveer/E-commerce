import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sample_project/models/cart_model.dart';
import 'package:sample_project/models/products_model.dart';

class CartProvider {
  CartProvider({required this.client});

  late final http.Client client;
  // ProductsProvider productsProvider;

  Future<List<CartModel>> getCartDetails() async {
    try {
      const apiUrl = "https://fakestoreapi.com/carts/user/4";

      final response = await client.get(Uri.parse(apiUrl));

      List data = jsonDecode(response.body);

      // List productList = [];
      // Future<ProductsModel> productmodel;

      // final res = data.map((e) => CartModel.fromJson(e)).toList();
      // var list = res.map((a) => Product.fromJson(a.products.map((e) => Product.fromJson(e))));

      // final res = data.map((e) => CartModel.fromJson(e)).toList();
      // for (var item in res) {
      //   print("For loop");
      //   print(item.date);
      //   for (var prod in item.products) {
      //     print("For prod loop:prod ID");
      //     print(prod.productId);
      //     productList.add(prod.productId);
      //   }
      // }
      // for (var res in productList) {
      //   final data = productsProvider.getSingleProductDetail(res);
      // }

      return data.map((e) => CartModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<ProductsModel> getSingleProductDetail(String? id) async {
    try {
      String apiUrl = "https://fakestoreapi.com/products/" + id!;
      final response = await client.get(Uri.parse(apiUrl));

      ProductsModel productsModel =
          ProductsModel.fromJson(json.decode(response.body));

      return productsModel;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
