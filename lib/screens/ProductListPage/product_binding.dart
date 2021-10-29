import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:sample_project/providers/products_provider.dart';
import 'package:sample_project/repository/products_repository.dart';
import 'package:sample_project/screens/ProductListPage/product_controller.dart';

class UserListBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(
      ProductController(
          productsProvider: ProductsProvider(
              client: Client(), productRepository: ProductRepository()),
          productRepository: ProductRepository()),
    );
  }
}
