import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sample_project/models/category_model.dart';
import 'package:sample_project/models/products_model.dart';
import 'package:sample_project/models/user_model.dart';
import 'package:sample_project/repository/products_repository.dart';

class ProductsProvider {
  ProductsProvider({required this.client, required this.productRepository});

  late final http.Client client;

  ProductRepository productRepository;

  // Future<ProductsModel> getProductList() async {
  //   try {
  //     const apiUrl = "https://fakestoreapi.com/products";

  //     final response = await client.get(Uri.parse(apiUrl));

  //     final data = jsonDecode(response.body);
  //     final productsResponse = ProductsModel.fromJson(data);
  //     return productsResponse;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  Future<List<ProductsModel>> getProdList() async {
    try {
      const apiUrl = "https://fakestoreapi.com/products";

      final response = await client.get(Uri.parse(apiUrl));

      List data = jsonDecode(response.body);

      // final ress = ProductsModel.fromJson(data as Map<String, dynamic>);
      final result = data.map((e) => ProductsModel.fromJson(e)).toList();

      for (var items in result) {
        print("EmpList" + items.price.toString());
        productRepository.saveProductList(items);
      }

      return data.map((e) => ProductsModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<dynamic>> getCategoriesList() async {
    try {
      const apiUrl = "https://fakestoreapi.com/products/categories";
      final response = await client.get(Uri.parse(apiUrl));

      List data = jsonDecode(response.body);
      // final result = CategoryModel.fromJson(data);

      return data;
      // data.map((e) => CategoryModel.fromJson(e)).toList();
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

  Future<UserModel> getSingleUserDetail(String? id) async {
    try {
      String apiUrl = "https://fakestoreapi.com/products/" + id!;
      final response = await client.get(Uri.parse(apiUrl));

      UserModel userModel = UserModel.fromJson(json.decode(response.body));

      return userModel;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<ProductsModel>> getProductsCategories(
      {required String params}) async {
    try {
      String apiUrl = "https://fakestoreapi.com/products/category/" + params;

      final response = await client.get(Uri.parse(apiUrl));

      List data = jsonDecode(response.body);

      final result = data.map((e) => ProductsModel.fromJson(e)).toList();

      return result;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<UserModel>> getUserList() async {
    try {
      const apiUrl = "https://fakestoreapi.com/users";

      final response = await client.get(Uri.parse(apiUrl));

      List data = jsonDecode(response.body);

      return data.map((e) => UserModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
