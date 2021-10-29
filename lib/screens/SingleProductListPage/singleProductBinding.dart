// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:sample_project/providers/products_provider.dart';
import 'package:sample_project/repository/products_repository.dart';
import 'package:sample_project/screens/SingleProductListPage/singleProductController.dart';

class SingleProdBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(
      SingleProductController(
          productsProvider: ProductsProvider(
              client: Client(), productRepository: ProductRepository())),
    );
  }
}
