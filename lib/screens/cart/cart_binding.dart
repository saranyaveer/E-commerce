import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:sample_project/providers/cart_provider.dart';
import 'package:sample_project/repository/products_repository.dart';
import 'package:sample_project/screens/cart/cart_controller.dart';

class CartBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CartController(
      cartProvider: CartProvider(client: Client()),
      productRepository: ProductRepository(),
    ));
  }
}
