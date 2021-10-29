// ignore_for_file: file_names

import 'package:connectivity/connectivity.dart';
import 'package:sample_project/models/cart_model.dart';
import 'package:sample_project/models/products_model.dart';
import 'package:sample_project/services/db_service.dart';
import 'package:sqflite/sqflite.dart';

class ProductRepository {
  static String prodListTable = 'ProductList';
  static String prodQuantityTable = 'ProductQuantityTable';

  Future<List<ProductsModel>> getEmpList() async {
    final maps = (await DbServices.instance.query("ProductList"));
    List<ProductsModel> result = maps.isNotEmpty
        ? maps.map((e) => ProductsModel.fromJson(e)).toList()
        : [];
    return result;
  }

  Future<int> saveProductList(ProductsModel productList) async {
    var result = await DbServices.instance.insert(
        prodListTable, productList.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    // 'INSERT INTO $_employeeListTable ( Id,email,firstName,lastName,avatar) VALUES(?,?,?,?,?)',empList.toJson());
    // empList.toJson();
    return result;
  }

  Future<int> saveProductQuantityList(Product product) async {
    var result = await DbServices.instance.insert(
        prodQuantityTable, product.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    // 'INSERT INTO $_employeeListTable ( Id,email,firstName,lastName,avatar) VALUES(?,?,?,?,?)',empList.toJson());
    // empList.toJson();
    return result;
  }

  Future<List<ProductsModel>> cartItems(List<int?> prod) async {
    var response = await DbServices.instance.query(prodListTable,
        columns: ["id", "title", "price", "description", "category", "image"],
        where: "id IN (${('?' * (prod.length)).split('').join(', ')})",
        whereArgs: prod);
    // where: 'id = ?',
    // whereArgs: [prod]);
    List<ProductsModel> list = response.isNotEmpty
        ? response.map((e) => ProductsModel.fromJson(e)).toList()
        : [];
    // response.map((e) => ProductsModel.fromJson(e)).toList();
    return list;
  }
}
