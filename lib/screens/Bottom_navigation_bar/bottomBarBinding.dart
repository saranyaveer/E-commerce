// ignore_for_file: file_names

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:http/http.dart';
import 'package:sample_project/providers/cart_provider.dart';
import 'package:sample_project/providers/login_provider.dart';
import 'package:sample_project/providers/products_provider.dart';
import 'package:sample_project/repository/products_repository.dart';
import 'package:sample_project/screens/ProductListPage/product_controller.dart';
import 'package:sample_project/screens/cart/cart_controller.dart';
import 'package:sample_project/screens/login/login_controller.dart';

class BottomBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductController>(() => ProductController(
        productsProvider: ProductsProvider(
            client: Client(), productRepository: ProductRepository()),
        productRepository: ProductRepository()));
    Get.lazyPut<LoginController>(
        () => LoginController(loginProvider: LoginProvider(client: Client())));
    Get.lazyPut<CartController>(() => CartController(
        cartProvider: CartProvider(client: Client()),
        productRepository: ProductRepository()));
  }
}
