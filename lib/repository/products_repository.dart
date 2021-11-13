// ignore_for_file: file_names

import 'package:sample_project/models/cart_model.dart';
import 'package:sample_project/models/products_model.dart';
import 'package:sample_project/services/db_service.dart';
import 'package:sqflite/sqflite.dart';

class ProductRepository {
  static String prodListTable = 'ProductList';
  static String prodQuantityTable = 'ProductQuantityTable';
  static String favouriteProductTable = 'FavouriteProductTable';
  static String onlyfavouriteProductTable = 'FavouriteProductListTable';

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

  Future<int> saveFavProductList(Product product) async {
    var result = await DbServices.instance.insert(
        favouriteProductTable, product.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    // 'INSERT INTO $_employeeListTable ( Id,email,firstName,lastName,avatar) VALUES(?,?,?,?,?)',empList.toJson());
    // empList.toJson();
    return result;
  }

  Future<List<ProductsModel>> getFavouriteList() async {
    final maps = (await DbServices.instance.query("FavouriteProductListTable"));
    List<ProductsModel> result = maps.isNotEmpty
        ? maps.map((e) => ProductsModel.fromJson(e)).toList()
        : [];
    return result;
  }

  Future<int> saveFavourite(int productID) async {
    var res = await DbServices.instance.rawInsert(
        'INSERT OR REPLACE INTO FavouriteProductListTable (ProductId) VALUES(?)',
        [productID]);
    // var result = await DbServices.instance.insert(
    //     onlyfavouriteProductTable,
    //     {
    //       "ProductId": productID,
    //     },
    //  conflictAlgorithm: ConflictAlgorithm.replace);
    //,empList.toJson());
    // empList.toJson();
    return res;
  }

  // Future<List<int>> getFavouriteList1() async {
  //   var result = await DbServices.instance
  //       .rawQuery("Select * from FavouriteProductListTable");

  //   return result as List<int>;
  // }

  Future<List<int>> getFavouriteList1() async {
    // final result = await DbServices.instance
    //     .rawQuery("Select * from FavouriteProductListTable");
    final maps = (await DbServices.instance.query("FavouriteProductListTable"));
    var result = maps as List<int>;
    return result;
  }

  // Delete a record
  Future<int> deleteFavProductList(int id) async {
    var result = await DbServices.instance
        .rawDelete('DELETE FROM FavouriteProductListTable WHERE id = ?', [id]);
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

  Future<List<ProductsModel>> searchProductList(String txt) async {
    var response = await DbServices.instance.query(prodListTable,
        columns: ["id", "title", "price", "description", "category", "image"],
        where: "title like '%?%';",
        whereArgs: [txt]);
    // where: 'id = ?',
    // whereArgs: [prod]);
    List<ProductsModel> result = response.isNotEmpty
        ? response.map((e) => ProductsModel.fromJson(e)).toList()
        : [];
    return result;
    // List<ProductsModel> list = response.isNotEmpty
    //     ? response.map((e) => ProductsModel.fromJson(e)).toList()
    //     : [];
    // // response.map((e) => ProductsModel.fromJson(e)).toList();
    // return list;
  }
}
